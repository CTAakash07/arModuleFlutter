import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:testing_app/global_api_key.dart';

class ApiHelper {
  Future<Uint8List> removeBackGround(String imagePath) async {
    var request = http.MultipartRequest(
        "POST", Uri.parse("https://api.remove.bg/v1.0/removebg"));

    request.files.add(
      await http.MultipartFile.fromPath("image_file", imagePath)
    );

    request.headers.addAll(
      {
        "X-API-key": apiKeyForRemoveBackGround,
      }
    );

    final response = await request.send();

    if (response.statusCode == 200) {
       http.Response responseTransparant = await http.Response.fromStream(response);
       return responseTransparant.bodyBytes;
    } else {
      throw Exception("error occured :" + response.statusCode.toString());
    }

  }
}