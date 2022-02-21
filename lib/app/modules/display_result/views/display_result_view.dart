import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/display_result_controller.dart';

class DisplayResultView extends GetView<DisplayResultController> {
  final DisplayResultController _controller =
      Get.put(DisplayResultController());
  @override
  Widget build(BuildContext context) {
    //var totalBook = _controller.bookList.total.value;

    return
        //Obx(() =>
        Scaffold(
            appBar: AppBar(
              title: Text(
                  "Vyhladavanie naslo ${_controller.bookList.books.length} knih"),
              centerTitle: true,
            ),
            body: Center(
                child: FutureBuilder(
                    future: _controller.fetchProducts(),
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          itemCount: _controller.bookList.books.length,
                          itemBuilder: (context, index) {
                            return Card(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 7),
                                child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    onTap: () {
                                      Get.dialog(AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(60)),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 30, top: 0),
                                              child: Text(
                                                _controller.bookList
                                                    .books[index].subtitle,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Card(
                                                  color: Colors.amber,
                                                  child: SizedBox(
                                                    height: 50,
                                                    width: 90,
                                                    child: Center(
                                                        child: Text(
                                                      "${_controller.bookList.books[index].price}",
                                                      textScaleFactor: 2,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Container
                                                      //color: Colors.amber,
                                                      (
                                                          child: Column(
                                                    children: [
                                                      Text("Isbn13:"),
                                                      Text(
                                                        "${_controller.bookList.books[index].isbn13}",
                                                        //textScaleFactor: 2,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  )),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        actions: [
                                          Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              child: Stack(
                                                children: <Widget>[
                                                  Positioned.fill(
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: <Color>[
                                                            Color(0xFF0D47A1),
                                                            Color(0xFF1976D2),
                                                            Color(0xFF42A5F5),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      primary: Colors.white,
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 20),
                                                    ),
                                                    onPressed: () {
                                                      _controller.urlLink =
                                                          _controller.bookList
                                                              .books[index].url;
                                                      _controller.launchURL();
                                                      Get.back();
                                                    },
                                                    child: const Text('Kupit'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                        actionsPadding: EdgeInsets.all(20),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 30),
                                        titlePadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        title: Image.network(
                                          _controller
                                              .bookList.books[index].image,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ));
                                    },
                                    title: Text(_controller
                                        .bookList.books[index].title)));
                          },
                        );
                      } else {
                        return Center(
                          child: Container(
                              width: 100,
                              height: 100,
                              child: const CircularProgressIndicator(
                                strokeWidth: 10,
                              )),
                        );
                      }
                    })
                //),
                ));
  }
}
