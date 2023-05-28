import 'package:get/get.dart';
import '../../views/bing_view.dart';
import '../../views/chatGpt_view.dart';
import '../../views/google_view.dart';
import '../../views/humatai_view.dart';
import '../../views/main_view.dart';
import '../../views/noun_portal_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;
  static const CHATGPT = Routes.CHATGTP_VIEW;
  static const HUMATAI = Routes.HUMATAI_VIEW;
  static const BING = Routes.BING_VIEW;
  static const GOOGLE = Routes.GOOGLE_VIEW;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      //binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.CHATGPT_VIEW,
      page: () => const ChatGPTView(),
    ),
    GetPage(
      name: _Paths.HUMATAI_VIEW,
      page: () => const HumataiView(),
      //binding: HumataiBinding(),
    ),
    GetPage(
      name: _Paths.BING_VIEW,
      page: () => const BingView(),
      //binding: BingBinding(),
    ),
    GetPage(
      name: _Paths.GOOGLE_VIEW,
      page: () => const GoogleView(),
      //binding: GoogleBinding(),
    ),
    GetPage(
      name: _Paths.NOUN_PORTAL_VIEW,
      page: () => const NounPortalView(),
      //binding: NounPortalBinding(),
    ),
  ];
}
