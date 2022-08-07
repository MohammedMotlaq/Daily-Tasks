import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


import 'DataBase/main_database.dart';
import 'Screens/view_mode_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DBhelper.dbhelper.initDatabase();
  runApp(EasyLocalization(
    supportedLocales: [Locale('ar'),Locale('en')],
    path: 'assets/languages',
    fallbackLocale: Locale('en'),
    child: MyApp()));
}

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
              elevation: 0,
            ),
            primarySwatch: Colors.blue,

          ),
          home: View_Mode_Screen(),
          debugShowCheckedModeBanner: false,
        );
      }
    );
  }
}
