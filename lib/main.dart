

import 'package:dwanitask/util/initBinding.dart';
import 'package:dwanitask/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Appconst/appcolors.dart';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
void main() async{
  try {
    WidgetsFlutterBinding.ensureInitialized();
     await availableCameras();
  } on CameraException catch (e) {
   // _logError(e.code, e.description);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(color: AppcColors.txtgrey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: AppcColors.txtgrey,
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: AppcColors.green),
        appBarTheme: AppBarTheme(backgroundColor: AppcColors.green, elevation: 0,iconTheme: IconThemeData(color: AppcColors.white)),
        colorScheme: ColorScheme.fromSeed(seedColor: AppcColors.white,background: AppcColors.white,onBackground: AppcColors.white),
        useMaterial3: false,primaryColor: AppcColors.txtgrey,
      ),
      home: const Loginscreen(),
      initialBinding: InitiBinding(),
    );
  }

}

