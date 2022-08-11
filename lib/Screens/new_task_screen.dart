
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thingstodo/DataBase/main_database.dart';
import 'package:thingstodo/models/task_model.dart';

class New_Task_Screen extends StatefulWidget {
  Function function;
   New_Task_Screen({Key? key,required this.function}) : super(key: key);


  @override
  State<New_Task_Screen> createState() => _New_Task_ScreenState();
}


class _New_Task_ScreenState extends State<New_Task_Screen> {
  Color _colorContainer = Colors.white;
  Color _colorContainer1 = Colors.white;
  Color _colorContainer2 = Colors.white;
  Color _colorContainer3 = Colors.white;
  Color _colorContainer4 = Colors.white;
  Color _colorContainer5 = Colors.white;
  Color _colorContainer6 = Colors.white;
  Color _colorContainer7 = Colors.white;
  Color _colorContainer8 = Colors.white;
  Color _colorContainer9 = Colors.white;
  String? time ;
  String? periodTime;
  String imageAssets = 'assets/icons/dots.png';
  String content = "";
  String content_desc = "";


  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> formState = GlobalKey();
    TextEditingController controller = TextEditingController();
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('new_task'.tr(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.grey),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,

      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 255, 255, 1.0),
                Color.fromRGBO(210, 84, 246, 0.2),
              ]
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formState,
            child: Column(
              children: [
                Container(
                  width: 320.w,
                  height: 70.h,
                  margin: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('icon'.tr(),style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey),),
                      Container(
                        height: 46,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 8),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _colorContainer = _colorContainer == const Color.fromRGBO(159, 255, 255, 1.0) ?
                                    Colors.white :
                                    const Color.fromRGBO(159, 255, 255, 1.0);
                                    if(_colorContainer == const Color.fromRGBO(159, 255, 255, 1.0)){
                                      imageAssets = "assets/icons/shopping-cart.png";
                                    }else{
                                      imageAssets = "assets/icons/dots.png";
                                    }
                                    log(imageAssets);
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: _colorContainer ,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  margin: const EdgeInsets.fromLTRB(5,0,10,0),
                                  child: const Image(image: AssetImage('assets/icons/shopping-cart.png',),width: 20,height: 20,),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _colorContainer1 = _colorContainer1 == const Color.fromRGBO(159, 255, 255, 1.0) ?
                                    Colors.white :
                                    const Color.fromRGBO(159, 255, 255, 1.0);
                                    if(_colorContainer1 == const Color.fromRGBO(159, 255, 255, 1.0)){
                                      imageAssets = "assets/icons/coffee-cup.png";
                                    }else{
                                      imageAssets = "assets/icons/dots.png";
                                    }
                                    log(imageAssets);
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: _colorContainer1 ,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Image(image: AssetImage('assets/icons/coffee-cup.png'),width: 20,height: 20,),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _colorContainer2 = _colorContainer2 == const Color.fromRGBO(159, 255, 255, 1.0) ?
                                    Colors.white :
                                    const Color.fromRGBO(159, 255, 255, 1.0);
                                    if(_colorContainer2 == const Color.fromRGBO(159, 255, 255, 1.0)){
                                      imageAssets = "assets/icons/barbell.png";
                                    }else{
                                      imageAssets = "assets/icons/dots.png";
                                    }
                                    log(imageAssets);
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: _colorContainer2 ,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Image(image: AssetImage('assets/icons/barbell.png'),width: 20,height: 20,),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _colorContainer3 = _colorContainer3 == const Color.fromRGBO(159, 255, 255, 1.0) ?
                                    Colors.white :
                                    const Color.fromRGBO(159, 255, 255, 1.0);
                                    if(_colorContainer3 == const Color.fromRGBO(159, 255, 255, 1.0)){
                                      imageAssets = "assets/icons/book.png";
                                    }else{
                                      imageAssets = "assets/icons/dots.png";
                                    }
                                    log(imageAssets);
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: _colorContainer3 ,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Image(image: AssetImage('assets/icons/book.png'),width: 20,height: 20,),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _colorContainer4 = _colorContainer4 == const Color.fromRGBO(159, 255, 255, 1.0) ?
                                    Colors.white :
                                    const Color.fromRGBO(159, 255, 255, 1.0);
                                    if(_colorContainer4 == const Color.fromRGBO(159, 255, 255, 1.0)){
                                      imageAssets = "assets/icons/eat.png";
                                    }else{
                                      imageAssets = "assets/icons/dots.png";
                                    }
                                    log(imageAssets);
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: _colorContainer4 ,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Image(image: AssetImage('assets/icons/eat.png'),width: 20,height: 20,),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _colorContainer5 = _colorContainer5 == const Color.fromRGBO(159, 255, 255, 1.0) ?
                                    Colors.white :
                                    const Color.fromRGBO(159, 255, 255, 1.0);
                                    if(_colorContainer5 == const Color.fromRGBO(159, 255, 255, 1.0)){
                                      imageAssets = "assets/icons/location.png";
                                    }else{
                                      imageAssets = "assets/icons/dots.png";
                                    }
                                    log(imageAssets);
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: _colorContainer5 ,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Image(image: AssetImage('assets/icons/location.png'),width: 20,height: 20,),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _colorContainer6 = _colorContainer6 == const Color.fromRGBO(159, 255, 255, 1.0) ?
                                    Colors.white :
                                    const Color.fromRGBO(159, 255, 255, 1.0);
                                    if(_colorContainer6 == const Color.fromRGBO(159, 255, 255, 1.0)){
                                      imageAssets = "assets/icons/programming.png";
                                    }else{
                                      imageAssets = "assets/icons/dots.png";
                                    }
                                    log(imageAssets);
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: _colorContainer6 ,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Image(image: AssetImage('assets/icons/programming.png'),width: 20,height: 20,),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _colorContainer7 = _colorContainer7 == const Color.fromRGBO(159, 255, 255, 1.0) ?
                                    Colors.white :
                                    const Color.fromRGBO(159, 255, 255, 1.0);
                                    if(_colorContainer7 == const Color.fromRGBO(159, 255, 255, 1.0)){
                                      imageAssets = "assets/icons/sleeping.png";
                                    }else{
                                      imageAssets = "assets/icons/dots.png";
                                    }
                                    log(imageAssets);
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: _colorContainer7 ,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Image(image: AssetImage('assets/icons/sleeping.png'),width: 20,height: 20,),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _colorContainer8 = _colorContainer8 == const Color.fromRGBO(159, 255, 255, 1.0) ?
                                    Colors.white :
                                    const Color.fromRGBO(159, 255, 255, 1.0);
                                    if(_colorContainer8 == const Color.fromRGBO(159, 255, 255, 1.0)){
                                      imageAssets = "assets/icons/sports.png";
                                    }else{
                                      imageAssets = "assets/icons/dots.png";
                                    }
                                    log(imageAssets);
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: _colorContainer8 ,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Image(image: AssetImage('assets/icons/sports.png'),width: 20,height: 20,),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _colorContainer9 = _colorContainer9 ==const Color.fromRGBO(159, 255, 255, 1.0) ?
                                    Colors.white :
                                    const Color.fromRGBO(159, 255, 255, 1.0);
                                    if(_colorContainer9 == const Color.fromRGBO(159, 255, 255, 1.0)){
                                      imageAssets = "assets/icons/dots.png";
                                    }else{
                                      imageAssets = "assets/icons/dots.png";
                                    }
                                    log(imageAssets);
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: _colorContainer9 ,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Image(image: AssetImage('assets/icons/dots.png'),width: 20,height: 20,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 320.w,
                  height: 91.h,
                  margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('task_title'.tr(),style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey),),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          onChanged: (value){
                             content = value;
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Required *';
                            }else if(value.length < 3){
                              return "your content must be more than 3 characters";
                            }
                          },
                          controller: controller ,
                          textAlign: TextAlign.start,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            fillColor: const Color.fromRGBO(255, 255, 255, 1),
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                              gapPadding: 0,
                            ),
                          ),
                          maxLines: 1,
                          maxLength: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 320.w,
                  height: 160.h,
                  margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('task_des'.tr(),style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey),),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          onChanged: (value){
                            content_desc = value;
                          },
                          controller: controller1 ,
                          textAlign: TextAlign.start,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            fillColor: const Color.fromRGBO(255, 255, 255, 1),
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),

                          ),
                          maxLines: 5,
                          maxLength: 300,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 320.w,
                  height: 102.h,
                  margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('task_time'.tr(),style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey),),
                          Container(
                            height: 80.h,
                            width: 200.w,
                            margin: const EdgeInsets.only(top: 5),
                            child: TextFormField(
                              onChanged: (value){
                                time = value;
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Required *';
                                }else if(value.length < 5){
                                  return "your content must be 5 characters";
                                }
                                if(value.contains(':')){
                                  return null;
                                }else{
                                  return ": not found!";
                                }
                              },
                              controller: controller2 ,
                              textAlign: TextAlign.start,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                fillColor: const Color.fromRGBO(255, 255, 255, 1),
                                filled: true,
                                hintText: 'ex_task_time'.tr(),
                                hintStyle:const TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                  gapPadding: 0,
                                ),
                              ),
                              maxLines: 1,
                              maxLength: 5,
                              keyboardType: TextInputType.datetime,
                            ),
                          ),

                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('period'.tr(),style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey),),
                          Container(
                            height: 80.h,
                            width: 100.w,
                            margin: const EdgeInsets.only(top: 5),
                            child: TextFormField(
                              onChanged: (value){
                                periodTime = value;
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Required *';
                                }else if(value.length < 2){
                                  return "your content must be 2 characters";
                                }
                                if(value == 'AM' || value == 'PM'|| value == 'am'|| value == 'pm'){
                                  return null;
                                }else{
                                  return "Invalid Period!!";
                                }
                              },
                              controller: controller3 ,
                              textAlign: TextAlign.start,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                fillColor: const Color.fromRGBO(255, 255, 255, 1),
                                filled: true,
                                hintText: 'period_ex'.tr(),
                                hintStyle:const TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                  gapPadding: 0,
                                ),
                              ),
                              maxLines: 1,
                              maxLength: 2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple.shade400),
                    elevation: MaterialStateProperty.all(10),
                  ),
                  onPressed: (){
                    if (formState.currentState!.validate()) {
                      DBhelper.dbhelper.insertNewTask(TaskModel(title: content, desc: content_desc, time: time, icon: imageAssets,periodTime: periodTime));
                      controller.text = "";
                      controller1.text = "";
                      controller2.text = "";
                      controller3.text = "";
                      widget.function();
                      Navigator.pop(context);
                    }
                  },
                  child: Text('add_new'.tr(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,),textAlign: TextAlign.center,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}