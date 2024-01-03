import 'package:flutter/material.dart';
import 'package:time_app/model/time.dart';
import 'package:time_app/repository/time_repository.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final repository = TimeRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder'),
      ),
      body: StreamBuilder<Time>(
        stream: repository.getTimeStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('no data'),
            );
          }
          final Time time = snapshot.data!;
          return Center(
            child: Column(
              children: [
                Text(
                  time.time,
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                Text(
                  time.utcTime,
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
