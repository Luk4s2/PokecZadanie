import 'package:flutter/material.dart';
import 'package:flutter_application_pokec_zadanie/app/modules/display_result/controllers/display_result_controller.dart';
import 'package:flutter_application_pokec_zadanie/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  final SearchScreenController _controller = Get.put(SearchScreenController());
  final DisplayResultController _displayController =
      Get.put(DisplayResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ItBook vyhladavanie knih'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Zadaj nazov knihy alebo klucove slovo',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            ),
            TextField(
                onChanged: (text) {
                  _controller.inputText = text;
                },
                controller: TextEditingController(),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.blueAccent,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Nazov knihy ...",
                )),
            ElevatedButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  TextEditingController().clear();
                  print(_controller.inputText);
                  await _displayController.fetchProducts();
                  Get.toNamed(Routes.DISPLAY_RESULT);
                },
                child: Text("Vyhladat"))
          ],
        ),
      ),
    );
  }
}
