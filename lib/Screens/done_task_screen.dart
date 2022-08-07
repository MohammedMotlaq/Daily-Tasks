import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../DataBase/data_repo.dart';

class Done_Task_Screen extends StatefulWidget {
  const Done_Task_Screen({Key? key}) : super(key: key);

  @override
  State<Done_Task_Screen> createState() => _Done_Task_ScreenState();
}

class _Done_Task_ScreenState extends State<Done_Task_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('done_task'.tr(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 20.sp),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.grey),
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
              return Container(
                width: 317.w,
                height: 52.h,
                margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(208, 252, 212, 0.9019607843137255),
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
              );
            }
        ),
      ),
    );
  }
}

