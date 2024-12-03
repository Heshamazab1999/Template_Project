import 'package:dio/dio.dart';
import 'package:template/helper/cache_helper.dart';
import 'package:template/utill/app_constants.dart';

import 'dio_integration.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  int maxCharactersPerLine = 200;

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("--> ${options.method} ${options.path}");
    print("Headers: ${options.headers.toString()}");
    print("<-- END HTTP");

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    print(
        "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");

    String responseAsString = response.data.toString();

    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        print(
            responseAsString.substring(i * maxCharactersPerLine, endingIndex));
      }
    } else {
      print(response.data);
    }

    print("<-- END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      print("Token is invalid or expired. Attempting to refresh...");

      // Check if the current token is null or invalid and handle token refresh logic
      if (CacheHelper.getData(key: AppConstants.token) == null) {
        // Logic to fetch or refresh the token
        String? newToken = await refreshAuthToken(); // Implement this method to fetch a new token

        if (newToken != null) {
          // Update the token in CacheHelper
          CacheHelper.setData(key: AppConstants.token, value: newToken);
          DioUtilNew.setDioAgain(); // Reset Dio instance with updated headers

          // Retry the failed request with the new token
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newToken';
          return await DioUtilNew.dio.fetch(options);
        }
      }
    print(
        "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    return super.onError(err, handler);
  }

  // @override
  // Future onError(DioError err, ErrorInterceptorHandler handler) async {
  //   // Check if the error is 401 Unauthorized
  //   if (err.response?.statusCode == 401) {
  //     print("Token is invalid or expired. Attempting to refresh...");
  //
  //     // Check if the current token is null or invalid and handle token refresh logic
  //     if (CacheHelper.getData(key: AppConstants.token) == null) {
  //       // Logic to fetch or refresh the token
  //       String? newToken = await refreshAuthToken(); // Implement this method to fetch a new token
  //
  //       if (newToken != null) {
  //         // Update the token in CacheHelper
  //         CacheHelper.setData(key: AppConstants.token, value: newToken);
  //         DioUtilNew.setDioAgain(); // Reset Dio instance with updated headers
  //
  //         // Retry the failed request with the new token
  //         final options = err.requestOptions;
  //         options.headers['Authorization'] = 'Bearer $newToken';
  //         return await DioUtilNew.dio.fetch(options);
  //       }
  //     }
  //   }

    // Print and pass the error to the handler
  //   print("ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
  //   return super.onError(err, handler);
  // }
}
  Future<String?> refreshAuthToken({String? email, password}) async {
    // Add your logic to call the token refresh endpoint and return the new token
    try {
      Response response = await Dio().post(AppConstants.login, data: {
        {"email": email, "password": password}

      });

      if (response.statusCode == 200) {
        // Extract and return the new token from the response
        return response.data['token']; // Adjust based on your response structure
      }
    } catch (e) {
      print("Failed to refresh token: $e");
    }

    return null; // Return null if token refresh fails
  }
}
