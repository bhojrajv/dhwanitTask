import 'package:dwanitask/Appconst/appcolors.dart';
import 'package:dwanitask/view/widgets/commonButtong.dart';
import 'package:dwanitask/view/widgets/common_textfield.dart';
import 'package:dwanitask/view/widgets/logo_widget.dart';
import 'package:dwanitask/viewmodel/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatePage extends StatefulWidget {
  const StatePage({Key? key}) : super(key: key);

  @override
  State<StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  final TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Statecontroller>(
      builder: (state_controller) {
        return Scaffold(
          appBar: AppBar(actions: [Padding(
            padding: const EdgeInsets.only(right: 20.0,bottom: 5,top: 5),
            child: LogoWidget(height: 25, width: 50, fontsize: 10),
          )],
            title: Text("State"),),
          body:state_controller.state_list.value.length<=0? state_controller.getStateRes.value.status==200?
              bodydata(state_controller: state_controller)
         :Center(child: CircularProgressIndicator(),):bodydata2(state_controller: state_controller),
          floatingActionButton: FloatingActionButton(onPressed: (){
            stateDialogue(context: context,st_controller: state_controller);
          },child: Icon(Icons.add),),
        );
      }
    );

  }

  void stateDialogue({context,Statecontroller? st_controller})async{
    showDialog(
        context: context, builder: (cont){
      return AlertDialog(content: Column(mainAxisSize: MainAxisSize.min,
        children: [TextFieldForms(controller:controller ,label: 'Enter state name',),
       const SizedBox(height: 15,),
      CommonButton(label: "Submit",
          callbackfun: (){
            st_controller?.addState(state: controller.text);
            Get.back();
          })],),);
    });
  }
  Widget bodydata({required Statecontroller state_controller }){
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemCount:state_controller.getStateRes.value.state?.length,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return  Card(elevation: 1,
                  shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: AppcColors.logocolor.withOpacity(.4))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("${state_controller.getStateRes.value.state![index].stateName}",style: TextStyle(color: AppcColors.green,fontSize: 16,),),const SizedBox(height: 10,),Icon(Icons.arrow_forward_outlined,color: AppcColors.green,)],),
                  ));
            })
    );
  }
  Widget bodydata2({required Statecontroller state_controller }){
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemCount:state_controller.state_list.value.length,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return  Card(elevation: 1,
                  shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: AppcColors.logocolor.withOpacity(.4))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("${state_controller.state_list.value[index]}",style: TextStyle(color: AppcColors.green,fontSize: 16,),),const SizedBox(height: 10,),Icon(Icons.arrow_forward_outlined,color: AppcColors.green,)],),
                  ));
            })
    );
  }
}
