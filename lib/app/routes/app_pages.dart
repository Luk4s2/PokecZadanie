import 'package:get/get.dart';

import 'package:flutter_application_pokec_zadanie/app/modules/display_result/bindings/display_result_binding.dart';
import 'package:flutter_application_pokec_zadanie/app/modules/display_result/views/display_result_view.dart';
import 'package:flutter_application_pokec_zadanie/app/modules/search_Screen/bindings/search_screen_binding.dart';
import 'package:flutter_application_pokec_zadanie/app/modules/search_Screen/views/search_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SEARCH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () => SearchScreenView(),
      binding: SearchScreenBinding(),
    ),
    GetPage(
      name: _Paths.DISPLAY_RESULT,
      page: () => DisplayResultView(),
      binding: DisplayResultBinding(),
    ),
  ];
}
