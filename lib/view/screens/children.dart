import 'package:dwanitask/Appconst/appcolors.dart';
import 'package:dwanitask/view/screens/add_children.dart';
import 'package:dwanitask/view/screens/children_details.dart';
import 'package:dwanitask/view/widgets/logo_widget.dart';
import 'package:dwanitask/viewmodel/childCrontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildrenPage extends StatefulWidget {
  const ChildrenPage({Key? key}) : super(key: key);

  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildController>(
      builder: (child_controller) {
        return Scaffold(
          appBar: AppBar(actions: [Padding(
            padding: const EdgeInsets.only(right: 20.0,bottom: 5,top: 5),
            child: LogoWidget(height: 25, width: 50, fontsize: 10),
          )],
            title: Text("Children"),),
          body:child_controller.getchildRes.value.status==200? Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){Get.to(()=>ChildrenDetails());},
              child:ListView.builder(
                  itemCount: child_controller.getchildRes.value.childProfile?.length,
                  itemBuilder: (context,index){
                return  Card(elevation: 1,
                    shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: AppcColors.logocolor.withOpacity(.4))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${child_controller.getchildRes.value.childProfile?[index].name}",style: TextStyle(color: AppcColors.green,fontSize: 16,),),
                            const SizedBox(height: 8.0,),
                            Text("${child_controller.getchildRes.value.childProfile?[index].fatherName??""}",style: TextStyle(color: AppcColors.green.withOpacity(.8),fontSize: 16,),),
                          ],
                        ),const SizedBox(height: 10,),Icon(Icons.arrow_forward_outlined,color: AppcColors.green,)],),
                    ));
              })
            ),
          ):Center(child: CircularProgressIndicator(),),
          floatingActionButton: FloatingActionButton(onPressed: (){
            Get.to(()=>AddChildrenPage());
          },child: Icon(Icons.add),),
        );
      }
    );
  }
}
