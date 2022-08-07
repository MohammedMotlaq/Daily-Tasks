import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Settings extends StatefulWidget {
  Function function;
   Settings({Key? key,required this.function}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setting'.tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.grey),

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 360.w,
          height: 640.h,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                child: Text('select_lang'.tr(),style: TextStyle(fontSize: 15),)
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: (){
                        context.setLocale(Locale('ar'));
                        setState((){});
                      },
                      child: Text('ar'.tr(),style: TextStyle(fontSize: 15),)
                    ),
                    TextButton(
                        onPressed: (){
                          context.setLocale(Locale('en'));
                          setState((){});
                        },
                        child: Text('en'.tr(),style: TextStyle(fontSize: 15),)
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('version'.tr(),style: TextStyle(fontSize: 15),),
                    Text('1.0.0',style: TextStyle(fontSize: 12,color: Colors.grey),),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}


// Container(
// child:IconButton(onPressed: (){
// if(context.locale.toString()=="ar"){
// context.setLocale(Locale('en'));
// }else{
// context.setLocale(Locale('ar'));
// }
// }, icon: Icon(Icons.language)),
// ),
