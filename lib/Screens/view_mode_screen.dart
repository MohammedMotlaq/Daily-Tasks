import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lottie/lottie.dart';
import 'package:thingstodo/DataBase/main_database.dart';
import 'package:thingstodo/models/task_model.dart';

import '../DataBase/data_repo.dart';
import '../Drawer Settings/about.dart';
import '../Drawer Settings/settings.dart';
import '../Drawer Settings/userguide.dart';
import 'done_task_screen.dart';
import 'make_it_done_screen.dart';
import 'new_task_screen.dart';
class View_Mode_Screen extends StatefulWidget {

   View_Mode_Screen({Key? key}) : super(key: key);
  @override
  State<View_Mode_Screen> createState() => _View_Mode_ScreenState();
}

class _View_Mode_ScreenState extends State<View_Mode_Screen> {


  void initState(){
    super.initState();
    getAllTasks();

  }


  getAllTasks() async{
    tasks = await DBhelper.dbhelper.selectAllTask();
    setState((){});
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  refresh () {
    getAllTasks();
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
        title: Text('app_name'.tr(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 25.sp),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Image.asset('assets/icons/menu.png',width: 24.w,height: 24.h,),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width:double.infinity,
              height: 200.h,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/drawerImage.jpg'),fit: BoxFit.cover),

              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 20, 0, 0),
              child: Column(
                children: [
                  ListTile(
                    leading:const Icon(Icons.settings,size: 25,),
                    trailing: const Icon(Icons.arrow_forward_ios,size: 15,),
                    title: Text('setting'.tr(),style: TextStyle(fontSize: 17),),
                    onTap: (){
                      //Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(function:refresh)));
                    },
                  ),
                  const Divider(
                    endIndent:20 ,
                    indent: 20,
                    thickness: 0.8,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading:const Icon(Icons.tips_and_updates_rounded,size: 25,),
                    trailing: const Icon(Icons.arrow_forward_ios,size: 15,),
                    title: Text('user_guide'.tr(),style: TextStyle(fontSize: 17),),
                    onTap: (){
                      //Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => User_Guide()));
                    },
                  ),
                  const Divider(
                    endIndent:20 ,
                    indent: 20,
                    thickness: 0.8,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading:const Icon(Icons.info_outline_rounded,size: 25,),
                    trailing: const Icon(Icons.arrow_forward_ios,size: 15,),
                    title: Text('about'.tr(),style: TextStyle(fontSize: 17),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
                    },
                  ),
                  Container(
                    width:200.w,
                    height: 150.h,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 30),
                    child: const Text(
                      'Make A Cup of Coffee \n And Enjoy your Day \nDoing Your Job',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200,fontFamily: 'Ginger',color: Color.fromRGBO(
                          126, 68, 3, 1.0)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),

      body: Container(
        width:double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/mainScreenImage.jpg'),fit: BoxFit.cover),
        ),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index){
            return InkWell(
              onTap: () async{
                await showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return Dialog(
                      backgroundColor: Color.fromRGBO(255, 255, 255, 0.88),
                      alignment: Alignment.center,
                      child: Container(
                        width: 320.w,
                        height: 380.h,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Image(image: AssetImage(tasks[index].icon!),),
                            ),
                            Container(
                              width: 243.w,
                              height: 20.h,
                              child: Text(tasks[index].title??"no Title",
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 80.w,
                              height: 20.h,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 26.w,
                                    height: 14.h,
                                    child: Text(tasks[index].time??"00:00",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: 26.w,
                                    height: 14.h,
                                    child: const Text('PM',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 70.w,
                              height: 16.h,
                              margin: EdgeInsets.only(top: 50),
                              child: Text(
                                'des'.tr(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              width: 280.w,
                              height: 110.h,
                              margin: const EdgeInsets.fromLTRB(0, 15,0,50),
                              child: Text(
                                tasks[index].desc!,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 15,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 132.w,
                                height: 46.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color.fromRGBO(228, 167, 248, 1.0),
                                      Color.fromRGBO(166, 237, 246, 1.0),
                                      //Color.fromRGBO(1, 40, 238, 1.0),
                                    ]
                                  ),
                                ),
                                child: Text(
                                  'done_dialog'.tr(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: 317.w,
                height: 52.h,
                margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child:  Image(image: AssetImage(tasks[index].icon!),),
                    ),
                    Container(
                      width: 210.w,
                      height: 19.h,
                      margin: EdgeInsets.only(top: 5),
                      child:  Text(tasks[index].title!,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      width: 40.w,
                      height: 40.h,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 28.w,
                            height: 14.h,
                            child:  Text(tasks[index].time??"NO TIME",
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: 24.w,
                            height: 14.h,
                            child: Text(tasks[index].periodTime ?? '--',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
      bottomSheet: Container(
        height: 70.h,
        width: 360.w,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.8),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
        ),
        child: Container(
          width: 56.w,
          height: 30.h,
          margin: const EdgeInsets.fromLTRB(35,20,35,20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Make_it_Done_Task(function: getAllTasks,);
                  }));
                },
                child: Container(
                  width: 40.w,
                  height: 35.h,
                  margin: const EdgeInsets.only(bottom: 4),
                  child:const Image(image: AssetImage('assets/icons/list.png'),fit: BoxFit.fill,),
                ),
              ),
              // InkWell(
              //   onTap: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context){
              //       return Done_Task_Screen();
              //     }));
              //   },
              //   child: Container(
              //     width: 40.w,
              //     height: 35.h,
              //     margin: const EdgeInsets.only(bottom: 4),
              //     child: const Image(image: AssetImage('assets/icons/check.png'),),
              //   ),
              // ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return New_Task_Screen(function: refresh,);
                  }));
                },
                child: Container(
                  width: 40.w,
                  height: 35.h,
                  margin: const EdgeInsets.only(bottom: 4),
                  child: const Image(image: AssetImage('assets/icons/add-document.png'),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

