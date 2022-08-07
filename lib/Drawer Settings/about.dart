import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('about'.tr(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.grey),
        elevation: 0,
      ),
      body: Container(
        width: 360.w,
        height: 640.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 255, 255, 1.0),
              Color.fromRGBO(198, 187, 245, 1.0),
            ]
          )
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('glimpse'.tr(),style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                Container(
                  width: 330.w,
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    'the_glimpse'.tr(),
                    style: const TextStyle(fontSize: 15,fontWeight: FontWeight.normal,),
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
