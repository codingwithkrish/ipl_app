import 'dart:convert';

import 'package:http/http.dart';

class AdpterIpl {
  String? name;
  Future<void> getdata() async {
    String api =
        "https://api.cricapi.com/v1/series_info?apikey=576f1519-a1f2-4b9a-9d55-e37bf0538028&offset=0&id=47b54677-34de-4378-9019-154e82b9cc1a";
    try {
      Response response = await get(Uri.parse(
          "https://api.cricapi.com/v1/series_info?apikey=576f1519-a1f2-4b9a-9d55-e37bf0538028&offset=0&id=47b54677-34de-4378-9019-154e82b9cc1a"));
      Map data = jsonDecode(response.body);
      Map dataa = data['data'];
      List d = dataa['matchList'];

      //List daa = data['matchList'];

      print(d);
    } catch (e) {
      print(e);
    }
  }
}
