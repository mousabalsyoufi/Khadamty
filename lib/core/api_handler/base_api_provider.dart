import 'package:dio/dio.dart';
import '../local_storage/storage_manager.dart';
import '../singletons/singletons.dart';

// Base Provider to provide the options of every Api Request

class BaseApiProvider {
  Dio client = getIt<Dio>();

  // request with token if available
  getRequestWithTokenIfAvailable() async {
    String? token = await StorageManager.getUserToken();
    Map<String, dynamic> headers = {
      "Content-Type": "application/json",
    };
    if (token != null) {
      headers["API-KEY"] = token;
    }
    Options options = Options(headers: headers);
    return options;
  }

  // request with token
  getRequestWithToken() async {
    String? token = await StorageManager.getUserToken();
    Options? options = Options(
        headers: {"Content-Type": "application/json", "API-KEY": token});
    return options;
  }

  // request without token
  getRequestWithoutToken() {
    Options options = Options(headers: {
      "Content-Type": "application/json",
    });
    return options;
  }
}
