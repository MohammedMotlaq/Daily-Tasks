import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thingstodo/DataBase/main_database.dart';
import '../models/task_model.dart';
class Task_Widget extends StatefulWidget {
  TaskModel taskmodel ;
  Function function;
  Function function2;
  Task_Widget({Key? key,required this.taskmodel,required this.function,required this.function2}) : super(key: key);

  @override
  State<Task_Widget> createState() => _Task_WidgetState();
}

class _Task_WidgetState extends State<Task_Widget> {
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 317.w,
      height: 52.h,
      margin:const EdgeInsets.fromLTRB(20, 30, 20, 0),
      decoration: BoxDecoration(
          color:const Color.fromRGBO(250, 224, 224, 0.9019607843137255),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            margin:const EdgeInsets.symmetric(horizontal: 10),
            child: Image(image: AssetImage(widget.taskmodel.icon!),),
          ),
          Container(
            width: 210.w,
            height: 19.h,
            margin:const EdgeInsets.only(top: 5),
            child:  Text(widget.taskmodel.title!,
              style:const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          InkWell(
            onTap: (){
            DBhelper.dbhelper.deleteOneTask(widget.taskmodel.id!);
            widget.function();
            widget.function2();
            },
            child:const Icon(Icons.delete_forever_rounded,color: Color.fromRGBO(203, 3, 3, 1.0),size: 30,)),
        ],
      ),
    );
  }
}