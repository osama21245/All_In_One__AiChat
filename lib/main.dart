import 'package:face_detector/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:face_detector/core/constant/localization/changelocal.dart';

//import 'core/constant/color.dart';
import 'core/constant/localization/translation.dart';
import 'core/constant/services/services.dart';
import 'core/constant/services/theme.dart';
import 'package:camera/camera.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await initialServices();
  cameras = await availableCameras();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    // MyServices myServices = Get.find();
    return GetMaterialApp(
      theme: ThemeSrevice().lightTheme,
      darkTheme: ThemeSrevice().darkTheme,
      translations: MyTranslation(),
      themeMode: ThemeSrevice().getThemeMode(),
      debugShowCheckedModeBanner: false,
      title: 'Easy Way',
      locale: controller.language,
      getPages: routes,
    );
  }
}
