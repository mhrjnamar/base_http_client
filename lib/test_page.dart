import 'package:base_http_client/controller/test_controller.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final controller = TestController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestPage'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                controller.getData();
              },
              child: Text("Get Data", style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () async {
                controller.postData();
              },
              child: Text("Post Data", style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
