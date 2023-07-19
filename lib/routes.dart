import 'package:face_detector/screens/Chat.dart';
import 'package:face_detector/screens/ImageLable.dart';
import 'package:face_detector/screens/TextDetector.dart';
import 'package:face_detector/screens/Translation.dart';
import 'package:face_detector/screens/home.dart';
import 'package:get/get.dart';

import 'core/constant/routesname.dart';
import 'screens/QRcode.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const Home(),
  ),
  GetPage(name: AppRoutes.textdetector, page: () => const TextDetector()),
  GetPage(name: AppRoutes.imagelabel, page: () => const ImageLabel()),
  GetPage(name: AppRoutes.AiChat, page: () => const AiChat()),
  GetPage(name: AppRoutes.Translation, page: () => const Translation()),
  GetPage(name: AppRoutes.QRcode, page: () => const QRcode()),
];
