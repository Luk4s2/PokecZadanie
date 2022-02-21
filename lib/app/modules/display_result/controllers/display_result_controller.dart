import 'package:flutter_application_pokec_zadanie/app/modules/display_result/http_service/http_service.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayResultController extends GetxController {
  dynamic bookList;
  String urlLink = "";
  @override
  void onInit() {
    //fetchProducts();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future fetchProducts() async {
    var books = await HttpService.fetchproducts();
    if (books != null) {
      bookList = books;
      return bookList;
    }
  }

  Future launchURL() async {
    var url = urlLink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
