import 'package:dwanitask/Appconst/appcolors.dart';
import 'package:dwanitask/view/widgets/logo_widget.dart';
import 'package:dwanitask/view/widgets/textview.dart';
import 'package:flutter/material.dart';

class ChildrenDetails extends StatefulWidget {
  const ChildrenDetails({Key? key}) : super(key: key);

  @override
  State<ChildrenDetails> createState() => _ChildrenDetailsState();
}

class _ChildrenDetailsState extends State<ChildrenDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(actions: [Padding(
      padding: const EdgeInsets.only(right: 20.0,bottom: 5,top: 5),
      child: LogoWidget(height: 25, width: 50, fontsize: 10),
    )],
      title: Text("Child Details"),),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 15),
      child: SingleChildScrollView(
        child: Card(
          shape: RoundedRectangleBorder(side: BorderSide(color: AppcColors.logocolor,width: 1)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 15.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Align(alignment: Alignment.center,
                child: ClipOval(
                  child: Container(
                    child: Icon(Icons.photo,),width: 110,height: 110,color: AppcColors.green,),
                ),
              ),const SizedBox(height: 20,),
                Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Expanded(flex:2,
                        child: CommonTextView(color: AppcColors.black,text: "Name:",
                        fonsize: 16,fontWeight: FontWeight.w500,),
                      ),Expanded(
                        child: CommonTextView(color: AppcColors.black,text: "Sex",
                        fonsize: 16,fontWeight: FontWeight.w500,),
                      )],),
                     const SizedBox(height:5,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Expanded(flex:2,
                        child: CommonTextView(color: AppcColors.greycolor,text: "Prakash",
                          fonsize: 16,fontWeight: FontWeight.w500,),
                      ),Expanded(
                        child: CommonTextView(color: AppcColors.greycolor,text: "Male",
                          fonsize: 16,fontWeight: FontWeight.w500,),
                      )],),
                    const SizedBox(height:15,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Expanded(flex:2,
                        child: CommonTextView(color: AppcColors.black,text: "Date Of Birth:",
                          fonsize: 15,fontWeight: FontWeight.w500,),
                      ),Expanded(
                        child: CommonTextView(color: AppcColors.black,text: "Fater'Name:",
                          fonsize: 15,fontWeight: FontWeight.w500,),
                      )],),
                    const SizedBox(height:5,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Expanded(flex:2,
                        child: CommonTextView(color: AppcColors.greycolor,text: "4/8/1994",
                          fonsize: 16,fontWeight: FontWeight.w500,),
                      ),Expanded(
                        child: CommonTextView(color: AppcColors.greycolor,text: "akdkdk",
                          fonsize: 16,fontWeight: FontWeight.w500,),
                      )],),

                    const SizedBox(height:15,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Expanded(flex:2,
                        child: CommonTextView(color: AppcColors.black,text: "Mother's Name:",
                          fonsize: 15,fontWeight: FontWeight.w500,),
                      ),Expanded(
                        child: CommonTextView(color: AppcColors.black,text: "State:",
                          fonsize: 15,fontWeight: FontWeight.w500,),
                      )],),
                    const SizedBox(height:5,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Expanded(flex:2,
                        child: CommonTextView(color: AppcColors.greycolor,text: "4/8/1994",
                          fonsize: 16,fontWeight: FontWeight.w500,),
                      ),Expanded(
                        child: CommonTextView(color: AppcColors.greycolor,text: "akdkdk",
                          fonsize: 16,fontWeight: FontWeight.w500,),
                      )],),
                  ],
                ),
            ],),
          ),
        ),
      ),
    ),);
  }
}
