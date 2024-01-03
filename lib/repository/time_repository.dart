import 'dart:async';

import 'package:time_app/data_source/time_api.dart';
import 'package:time_app/model/time.dart';

class TimeRepository {
  final _api = TimeApi();
  final _timeStream = StreamController<Time>();

  TimeRepository() {
    Timer.periodic(Duration(seconds: 2), (timer) async {
      final time = await _api.getTime();
      _timeStream.add(time);
    });
  }

  Future<Time> getTime() => _api.getTime();

  Stream<Time> getTimeStream() => _timeStream.stream;
}
