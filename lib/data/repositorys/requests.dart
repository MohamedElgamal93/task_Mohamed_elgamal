import 'package:dio/dio.dart';
import '../../../util/show_log.dart';
import '../model/error_model/error_model.dart';
import 'client.dart';
import 'endpoints.dart';

class RequestsRepository {
  final Client _client = Client();
  String? accessToken;

  RequestsRepository();

  dynamic _defaultErrorHandler(DioError error) {
    dynamic errorMessage;
    showLog("error", "${error.response}");
    if (error.response == null) {
      errorMessage = ErrorModel();
    }
    return errorMessage;
  }

  //homeData
  Future<dynamic> homeDataCondition() async {
    try {
      final response = await _client.init().get(Endpoint.homepageEndPoint);
      return response.data;
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      return _defaultErrorHandler(ex);
    }
  }
}
