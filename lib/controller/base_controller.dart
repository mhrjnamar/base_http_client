import 'package:base_http_client/helper/dialog_helper.dart';
import 'package:base_http_client/service/app_exceptions.dart';

class BaseController {
  void handleError(error) {
    if (error is BadRequestException) {
      //Show dialog
      DialogHelper.showErrorDialog(description: error.message ?? "");
    } else if (error is FetchDataException) {
      DialogHelper.showErrorDialog(description: error.message ?? "");
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(
          description: error.message ?? "Oops! It took longer to respond.");
    }
  }
}
