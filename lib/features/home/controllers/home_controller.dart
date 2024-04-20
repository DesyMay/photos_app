import 'package:get/get.dart' show GetxController;
import 'package:http/http.dart' as http;
import 'package:photos_app/features/home/models/image_model.dart';
import '../../../const/app_url.dart';
import 'dart:convert' show jsonDecode;

class HomeController extends GetxController {
  Future<List<ImageModel>?> fetchData() async {
    final response = await http.get(Uri.parse(AppUrl.baseURL));
    try {
      if (response.statusCode == 200) {
        final List data = (jsonDecode(response.body) as Map)['hits'];
        return data
            .map(
                (e) => ImageModel.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
