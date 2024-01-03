import 'package:flutter/material.dart';
import 'package:time_app/data_source/time_api.dart';
import 'package:time_app/model/time.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Time? _time;
  final _api = TimeApi();

  bool get isLoading => _time == null;

  Future<void> init() async {
    final time = await _api.getTime();
    setState(() {
      _time = time;
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('원래방식'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _time!.time,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    _time!.utcTime,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
