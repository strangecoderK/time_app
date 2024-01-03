import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:time_app/model/time.dart';

class TimeApi {
  Future<Time> getTime() async {
    final response = await http
        .get(Uri.parse('https://worldtimeapi.org/api/timezone/Asia/Seoul'));
    return Time.fromJson(jsonDecode(response.body));
  }
}
