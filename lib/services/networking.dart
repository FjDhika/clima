import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper({this.url});

  Future getData() async {
    try {
      var response = await http.get(this.url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
