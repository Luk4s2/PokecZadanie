import 'package:flutter/material.dart';
import 'package:flutter_application_pokec_zadanie/app/modules/search_Screen/views/search_screen_view.dart';
import 'package:flutter_application_pokec_zadanie/app/routes/app_pages.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
    getPages: AppPages.routes,
    debugShowCheckedModeBanner: false,
    home: SearchScreenView()));
