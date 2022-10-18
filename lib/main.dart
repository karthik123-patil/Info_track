import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:info/screens/login_screen.dart';
import 'package:info/utils/app_utils.dart';
import 'package:info/utils/colors.dart';
import 'package:info/utils/shared_preff.dart';
import 'package:info/utils/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    updateAppBar();
    getDeviceId();
    startApplication();
    super.initState();
  }

  void getDeviceId() async {
    AppUtils().getDeviceId().then((value) {
      StorageUtil.instance.setStringValue(AppStrings.strDeviceId, value.toString());
    });
  }

  void updateAppBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.appSubColor,
        systemNavigationBarColor: AppColors.appSubColor,
        systemNavigationBarIconBrightness: Brightness.light
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Center(
        child: Image.asset("assets/images/info_track.jpeg", scale: 1.5,),
      ),
    );
  }

  void startApplication() {
    Timer(const Duration(milliseconds: 3000), () async{

      Navigator
          .of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const LoginScreen();
      }));

    });
  }
}
