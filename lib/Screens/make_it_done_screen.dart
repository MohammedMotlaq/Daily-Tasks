import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../DataBase/data_repo.dart';
import '../DataBase/main_database.dart';
import '../models/task_model.dart';
import '../wedgit/taskwidget.dart';



class Make_it_Done_Task extends StatefulWidget {
  Function function;
   Make_it_Done_Task({Key? key,required this.function}) : super(key: key);

  @override
  State<Make_it_Done_Task> createState() => _Make_it_Done_TaskState();
}

class _Make_it_Done_TaskState extends State<Make_it_Done_Task> {
  getAllTasks() async{
    tasks = await DBhelper.dbhelper.selectAllTask();
    setState((){});
  }
  refresh () {
    getAllTasks();
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('make_it_done'.tr(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 20.sp),),
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
          itemCount: tasks.length,
          itemBuilder: (BuildContext context , int index){
            return  Task_Widget(taskmodel: tasks[index],function:widget.function,function2: getAllTasks,);
        }),
      ),
      // bottomSheet: Container(
      //   height: 70.h,
      //   width: 360.w,
      //   decoration: const BoxDecoration(
      //     color: Color.fromRGBO(255, 255, 255, 0.8),
      //     borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
      //   ),
      //   child: Container(
      //     width: 56.w,
      //     height: 46.h,
      //     margin: const EdgeInsets.fromLTRB(35,15,35,20),
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         InkWell(
      //           onTap: (){
      //
      //           },
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Container(
      //                 width: 40.w,
      //                 height: 35.h,
      //                 margin: const EdgeInsets.only(bottom: 4),
      //                 child:const Icon(Icons.delete_forever_rounded,color: Color.fromRGBO(203, 3, 3, 1.0),size: 40,),
      //               ),
      //             ],
      //           ),
      //         ),
      //         InkWell(
      //           onTap: (){
      //
      //           },
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Container(
      //                 width: 40.w,
      //                 height: 35.h,
      //                 margin: const EdgeInsets.only(bottom: 4),
      //                 child: const Image(image: AssetImage('assets/icons/double-check.png'),),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
