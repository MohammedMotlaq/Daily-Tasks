import 'package:thingstodo/DataBase/main_database.dart';

class TaskModel {
  int? id;
  String? icon;
  String? title;
  String? desc;
  String? time;
  String? periodTime;
  bool isComplete = false;
  TaskModel({
    this.title,
    this.desc,
    this.time,
    this.periodTime,
    this.icon,
    this.isComplete = false,
});
  TaskModel.fromMap(Map<String,dynamic> map){
    id = map[DBhelper.taskId];
    title = map[DBhelper.taskTitle];
    desc = map[DBhelper.taskDesc];
    time = map[DBhelper.taskTime];
    periodTime = map[DBhelper.periodTime];
    icon = map[DBhelper.taskIcon];
    isComplete = map[DBhelper.taskIsComplete]==1?true:false;


  }
  Map<String,dynamic> toMap(){
    return {
      DBhelper.taskTitle:title,
      DBhelper.taskDesc:desc,
      DBhelper.taskTime:time,
      DBhelper.periodTime:periodTime,
      DBhelper.taskIcon:icon,
      DBhelper.taskIsComplete:(isComplete)?1:0
    };
  }

}