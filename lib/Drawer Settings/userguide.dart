import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class User_Guide extends StatefulWidget {
  const User_Guide({Key? key}) : super(key: key);

  @override
  State<User_Guide> createState() => _User_GuideState();
}

class _User_GuideState extends State<User_Guide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('user_guide'.tr(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: Container(
        width: 360.w,
        height: 640.h,
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset('assets/icons/menu.png',width: 32.w,height: 32.h,),
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: Text('user_menu'.tr(),style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15),)
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/icons/add-document.png',width: 32.w,height: 32.h,),
                    Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: Text('user_add'.tr(),style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15),)
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/icons/list.png',width: 32.w,height: 32.h,),
                    Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: Text('user_check'.tr(),style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15),)
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.delete_forever_rounded,color: Color.fromRGBO(203, 3, 3, 1.0),size: 40,),
                    Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: Text('user_del'.tr(),style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15),)
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
