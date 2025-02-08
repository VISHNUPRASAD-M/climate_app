import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkinghelper{

  Networkinghelper(this.Url);
  final String Url;
  Future getdata() async {
    http.Response response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}