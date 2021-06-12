import 'package:base_http_client/service/base_client.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestPage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var response = await BaseClient().get(
                baseUrl: 'https://jsonplaceholder.typicode.com',
                api: '/todos/1');
            print(response);
          },
          child: Text("Test"),
        ),
      ),
    );
  }
}
