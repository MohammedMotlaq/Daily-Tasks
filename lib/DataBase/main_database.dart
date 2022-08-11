import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:thingstodo/models/task_model.dart';

class DBhelper{
  static DBhelper dbhelper = DBhelper();
  DbHelper() {
    initDatabase();
  }

  static const String tableName = 'taskTable';
  static const String taskId = 'id';
  static const String taskTitle = 'title';
  static const String taskDesc = 'desc';
  static const String taskIcon = 'icon';
  static const String taskTime = 'time';
  static const String periodTime = 'periodTime';
  static const String taskIsComplete = 'complete';
  Database? database;
  initDatabase () async{
    database = await createConnectionWithDatabase();
  }

    Future<Database> createConnectionWithDatabase() async{
    log("on createConnectionWithDatabase");
    String databasePath = await getDatabasesPath();
    String databaseName = 'database11';
    String fullPath = join(databasePath,databaseName);

    Database database = await openDatabase(fullPath,version: 1,onCreate: (db,i)async{
      log("in onCreate");
     await db.execute('''
        CREATE TABLE $tableName (
        $taskId INTEGER PRIMARY KEY AUTOINCREMENT,
        $taskTitle TEXT,
        $taskDesc TEXT,
        $taskIcon TEXT,
        $taskTime TEXT,
        $periodTime TEXT,
        $taskIsComplete INTEGER
        )
      ''');
      log('DataBase Created');
    },onOpen: (db){log('DataBase Opened');});
    return database;
  }

  insertNewTask(TaskModel taskModel) async{
    int rowIndex = await database!.insert(tableName, taskModel.toMap());
    log(rowIndex.toString());
  }

  Future<List<TaskModel>> selectAllTask() async{
    List<Map<String, Object?>> rowsAsMap = await database!.query(tableName);
    List<TaskModel> tasks = rowsAsMap.map((e) => TaskModel.fromMap(e)).toList();
    return tasks;
  }

  selectOneTask(int id){
    database!.query(tableName, where: '$taskId=?', whereArgs: [id]);
  }

  deleteOneTask(int id){
    database!.delete(tableName, where: '$taskId=?', whereArgs: [id]);
  }

}