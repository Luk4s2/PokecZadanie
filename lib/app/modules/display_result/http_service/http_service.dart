import 'package:flutter_application_pokec_zadanie/app/modules/models/book_store_model.dart';
import 'package:flutter_application_pokec_zadanie/app/modules/search_Screen/controllers/search_screen_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final SearchScreenController _controller = Get.put(SearchScreenController());

class HttpService {
  static var client = http.Client();

  static Future<ITbookResult> fetchproducts() async {
    String input = _controller.inputText;
    var response =
        await client.get("https://api.itbook.store/1.0/search/$input");
    if (response.statusCode == 200) {
      final ITbookResult book = iTbookResultFromJson(response.body);

      return book;
    } else {
      //Show Error
    }
  }
}
