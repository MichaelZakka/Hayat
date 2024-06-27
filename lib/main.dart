import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/app_storage.dart';
import 'package:hayat/controller/dependency_injection.dart';
import 'package:hayat/controller/firebase_api.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/firebase_options.dart';
import 'package:hayat/init_binding.dart';
import 'package:hayat/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //   if (Platform.isAndroid) {
  //     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //   }
  // });
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((_)async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  // await FirebaseMessaging.instance.subscribeToTopic('General');
  NetworkBinding.init();

  runApp(MyApp());
  // });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final InitController initController = Get.put(InitController());

  getToken() async {
    Future<String> token = await AppStorage.getToken();
    return await token;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(415, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
            initialBinding: InitialBinding(),
            defaultTransition: Transition.cupertino,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(),
            themeMode: ThemeMode.light,
            getPages: AppRouting.routes(),
            initialRoute: '/splashPage');
      },
    );
  }
}
