import 'package:base_http_client/controller/base_controller.dart';
import 'package:base_http_client/service/base_client.dart';

class TestController extends BaseController {
  Future<void> getData() async {
    var response = await BaseClient()
        .get(baseUrl: 'https://jsonplaceholder.typicode.com', api: '/todos/1')
        .catchError(handleError);
    if (response == null) return;
    print(response);
  }

  Future<void> postData() async {
    var request = {'message': 'Code and Sleep'};
    var response = await BaseClient()
        .post(
            baseUrl: 'https://jsonplaceholder.typicode.com',
            api: '/posts',
            payloadObj: request)
        .catchError(handleError);
    if (response == null) return;
    print(response);
  }
}
