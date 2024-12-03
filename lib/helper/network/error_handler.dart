import 'package:dio/dio.dart';
import 'package:template/utill/app_constants.dart';
import 'package:template/view/base/custom_snackbar.dart';
import 'package:get/get.dart';

class HandleError {
  static handleException({int? response, String? error}) {
    switch (response) {
      case 400:
        showCustomSnackBar(
            isError: true, error ??= AppConstants.sendFailure.tr, Get.context!);
        break;
      case 401:
        showCustomSnackBar(
            isError: true, AppConstants.unauthorized.tr, Get.context!);
        break;
      case 404:
        showCustomSnackBar(
            isError: true, AppConstants.notFoundUrl.tr, Get.context!);
        break;
      case 403:
        showCustomSnackBar(
            isError: true, AppConstants.notHasAuthorized.tr, Get.context!);
        break;
      case 500:
        showCustomSnackBar(
            isError: true, AppConstants.serverFailure.tr, Get.context!);
        break;
      case 502:
        showCustomSnackBar(
            isError: true, AppConstants.serverFailure.tr, Get.context!);
        break;
    }
  }

  static handleExceptionDio(DioExceptionType dioExceptionType) {
    switch (dioExceptionType) {
      case DioExceptionType.connectionTimeout:
        // TODO: Handle this case.
        showCustomSnackBar(isError: true, 'connection Timeout', Get.context!);
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        showCustomSnackBar(isError: true, 'bad Certificate', Get.context!);
        break;
      case DioExceptionType.badResponse:
        // TODO: Handle this case.
        showCustomSnackBar(isError: true, 'bad Response', Get.context!);
        break;
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        showCustomSnackBar(isError: true, 'connection Error', Get.context!);
        break;
      case DioExceptionType.unknown:
        // TODO: Handle this case.
        showCustomSnackBar(isError: true, 'unknown', Get.context!);
        break;
      case DioExceptionType.sendTimeout:
        showCustomSnackBar(isError: true, 'send Timeout', Get.context!);
        // TODO: Handle this case.
        break;
      case DioExceptionType.receiveTimeout:
        // TODO: Handle this case.
        showCustomSnackBar(isError: true, 'receive Timeout', Get.context!);
        break;
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        showCustomSnackBar(isError: true, 'request cancelled', Get.context!);
        break;
    }
  }
}
