import 'package:dio/dio.dart';
import 'package:template/helper/cache_helper.dart';
import 'package:template/utill/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class DioUtilNew {
  static DioUtilNew? _instance;
  static Dio? _dio;

  DioUtilNew._();

  static DioUtilNew getInstance() {
    if (_instance == null) {
      _instance = DioUtilNew._();
      _dio = Dio(_getOptions());
      _dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return _instance!;
  }

  static Dio get dio => _dio!;

  static void setDioAgain() {
    _dio = Dio(_getOptions());
    _dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));

    // Ensure authorization header is set correctly after login
    String? token = CacheHelper.getData(key: AppConstants.token);
    if (token != null && token.isNotEmpty) {
      _dio!.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  static BaseOptions _getOptions() {
    BaseOptions options = BaseOptions(
      followRedirects: false,
      validateStatus: (status) => status! <= 500,
    );

    options.connectTimeout = const Duration(seconds: 20);
    options.receiveTimeout = const Duration(seconds: 20);
    options.baseUrl = AppConstants.baseurl;
    options.headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer ${CacheHelper.getData(key: AppConstants.token)}",
      "Accept-Language": CacheHelper.getData(key: AppConstants.languageCode) == "en"
          ? "en-US"
          : "ar-EG"
    };
    options.queryParameters = {};

    return options;
  }
}