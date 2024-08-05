import 'package:dwanitask/Appconst/appcolors.dart';
import 'package:dwanitask/view/widgets/commonButtong.dart';
import 'package:dwanitask/view/widgets/common_textfield.dart';
import 'package:dwanitask/view/widgets/logo_widget.dart';
import 'package:dwanitask/viewmodel/distric_controller.dart';
import 'package:dwanitask/viewmodel/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DistrictPage extends StatefulWidget {
  const DistrictPage({Key? key}) : super(key: key);

  @override
  State<DistrictPage> createState() => _DistrictPageState();
}

class _DistrictPageState extends State<DistrictPage> {
  final TextEditingController controller=TextEditingController();
  List<String>menu=["Select State Name","State1","State2"];
  final state_controller=Get.find<Statecontroller>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DisContorller>(
      builder: (dis_controller) {
        return Scaffold(
          appBar: AppBar(actions: [Padding(
            padding: const EdgeInsets.only(right: 20.0,bottom: 5,top: 5),
            child: LogoWidget(height: 25, width: 50, fontsize: 10),
          )],
            title: Text("District"),),
          body:dis_controller.dist_list.value.length<=0?dis_controller.getDistRes.value.status==200?
              getDist2(dis_controller: dis_controller):Center(child: CircularProgressIndicator(),)
          :getDist(dis_controller: dis_controller),
          floatingActionButton: FloatingActionButton(onPressed: (){
            stateDialogue(context: context,disContorller: dis_controller);
          },child: Icon(Icons.add),),
        );
      }
    );
  }

  void stateDialogue({context,DisContorller?disContorller})async{
    showDialog(
        context: context, builder: (cont){
      return AlertDialog(content: Column(mainAxisSize: MainAxisSize.min,
        children: [
          DropDownWidget(),
          TextFieldForms(controller:controller ,label: 'Enter district name',),
          const SizedBox(height: 15,),
          CommonButton(label: "Submit",
              callbackfun: (){
                disContorller?.addDistrict(dist: controller.text);
            Get.back();})],),);
    });
  }
  Widget DropDownWidget(){
    return DropdownButton<String>(  value: state_controller.selectstate.value
        ,isExpanded: true,
        items: state_controller.getStateRes.value.state?.map<DropdownMenuItem<String>>((e){
      return DropdownMenuItem<String>(child: Text("${e.stateName}"),value: "${e.stateName}",);
    }).toList(), onChanged:(v){
      setState(() {
        state_controller.selectstate.value=v??"";
      });
    });
  }
  Widget getDist2({required DisContorller dis_controller}){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(itemCount: dis_controller.getDistRes.value.district?.length,
          shrinkWrap: true,
          itemBuilder: (context,index){
            return Card(elevation: 1,
                shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: AppcColors.logocolor.withOpacity(.4))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Row(
                      children: [
                        Text("DISTRICT:${dis_controller.getDistRes.value.district?[index].districtName}",style: TextStyle(color: AppcColors.green,fontSize: 16,),),
                        const SizedBox(width: 15,),
                        Text("STATE:${dis_controller.getDistRes.value.district?[index].stateId}",style: TextStyle(color: AppcColors.green,fontSize: 16,),),
                      ],
                    ),const SizedBox(height: 10,),Icon(Icons.arrow_forward_outlined,color: AppcColors.green,)],),
                ));
          }),
    );
  }

  Widget getDist({required DisContorller dis_controller}){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(itemCount: dis_controller.dist_list.value.length,
          shrinkWrap: true,
          itemBuilder: (context,index){
            return Card(elevation: 1,
                shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: AppcColors.logocolor.withOpacity(.4))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Row(
                      children: [
                        Text("DISTRICT:${dis_controller.dist_list.value[index]}",style: TextStyle(color: AppcColors.green,fontSize: 16,),),
                        const SizedBox(width: 15,),
                        Text("STATE:${index+1}",style: TextStyle(color: AppcColors.green,fontSize: 16,),),
                      ],
                    ),const SizedBox(height: 10,),Icon(Icons.arrow_forward_outlined,color: AppcColors.green,)],),
                ));
          }),
    );
  }
}
