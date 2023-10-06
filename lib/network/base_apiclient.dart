

import 'package:ap_sec/network/api_constant.dart';
import 'package:ap_sec/utils/error_handling_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BaseApiClient {
  late final Dio _client = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrlGAD,
      connectTimeout:
          Duration(seconds: 120), // Set connection timeout in milliseconds
      receiveTimeout:
          Duration(seconds: 120), // Set receive timeout in milliseconds
    ),
  )..interceptors.addAll([
      CustomInterceptor(),
      LoggingInterceptor(),
    ]);

  Future<dynamic> postCall(
    BuildContext context,
    String endPoint,
    dynamic payload, {
    String contenType = "application/json",
  }) async {
    try {
      final response = await _client.post(
        endPoint,
        data: payload,
        options: Options(headers: {
          'Content-Type': contenType,
        }),
      );
      print(response.data);
      print("payload $payload");
      return response.data;
    } on DioException catch (error) {
      print("error ${error.message}");
      return null;
    } catch (error) {
      return null;
    }
  }

  Future<dynamic> postCallParamsPayload(
    BuildContext context,
    String endPoint,
    Map<String, dynamic>? queryParam,
    dynamic payload, {
    String contenType = "application/json",
  }) async {
    try {
      final response = await _client.post(
        endPoint,
        queryParameters: queryParam,
        data: payload,
        options: Options(headers: {
          'Content-Type': contenType,
        }),
      );
      print(response.data);
      print("payload $payload");
      return response.data;
    } on DioException catch (error) {
      print("error ${error.message}");
      return null;
    } catch (error) {
      return null;
    }
  }

  Future<dynamic> getCallQueryParam(
    BuildContext context,
    String endPoint,
    Map<String, dynamic>? queryParam,
  ) async {
    try {
      final response = await _client.get(
        endPoint,
        queryParameters: queryParam,
      );
      print(response.data);

      return response.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {
        // Handle connection timeout error
        String errorMessage = "Connection timeout occurred.";
        ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      } else if (error.type == DioExceptionType.receiveTimeout) {
        // Handle receive timeout error
        String errorMessage = "Receive timeout occurred.";
        ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      } else {
        // Handle other Dio errors
        String errorMessage = ErrorHandlingUtils.handleError(error, context);
        ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      }
      return null;
    } catch (error) {
      // Handle other errors
      String errorMessage = ErrorHandlingUtils.handleError(error, context);
      ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      return null;
    }
  }

  Future<dynamic> getCall(
    BuildContext context,
    String endPoint,
  ) async {
    try {
      final response = await _client.get(
        endPoint
      );
      print(response.data);

      return response.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {
        // Handle connection timeout error
        String errorMessage = "Connection timeout occurred.";
        ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      } else if (error.type == DioExceptionType.receiveTimeout) {
        // Handle receive timeout error
        String errorMessage = "Receive timeout occurred.";
        ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      } else {
        // Handle other Dio errors
        String errorMessage = ErrorHandlingUtils.handleError(error, context);
        ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      }
      return null;
    } catch (error) {
      // Handle other errors
      String errorMessage = ErrorHandlingUtils.handleError(error, context);
      ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      return null;
    }
  }

  Future<dynamic> getCallParams(BuildContext context, String url,
      Map<String, dynamic> headers, Map<String, dynamic>? params,
      {String contentType = "application/json"}) async {
    bool _queryParamsPresent = false;
    if (params != null && params.isNotEmpty) {
      _queryParamsPresent = true;
    }
    try {
      var response = await _client.get(
        url,
        options: Options(headers: headers),
        queryParameters: _queryParamsPresent ? params : null,
      );
      print("Printing Response:::::::${response.data}");
      if (response.data == null || response.data.isEmpty) {
        // Handle empty or null response
        throw DioException(
          response: response,
          error: 'Empty or null response',
          requestOptions: response.requestOptions,
        );
      }
      return response.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {
        // Handle connection timeout error
        String errorMessage = "Connection timeout occurred.";
        ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      } else if (error.type == DioExceptionType.receiveTimeout) {
        // Handle receive timeout error
        String errorMessage = "Receive timeout occurred.";
        ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      } else {
        // Handle other Dio errors
        String errorMessage = ErrorHandlingUtils.handleError(error, context);
        ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      }
    } catch (error) {
      // Handle other errors
      String errorMessage = ErrorHandlingUtils.handleError(error, context);
      ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      return null;
    }
  }

  Future<dynamic> postAuthorizationCall(
    BuildContext context,
    String url,
    Map<String, dynamic> payload, {
    String contenType = "application/json",
    String? BearerToken,
  }) async {
    try {
      final response = await _client.post(
        url,
        data: payload,
        options: Options(headers: {
          'Content-Type': contenType,
          'Authorization': BearerToken,
        }),
      );
      print(response.data);
      print("postAuthorizationCall payload $payload");
      return response.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {
        // Handle connection timeout error
        String errorMessage = "Connection timeout occurred.";
        ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      } else if (error.type == DioExceptionType.receiveTimeout) {
        // Handle receive timeout error
        String errorMessage = "Receive timeout occurred.";
        ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      } else {
        // Handle other Dio errors
        String errorMessage = ErrorHandlingUtils.handleError(error, context);
        ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      }
      return null;
    } catch (error) {
      // Handle other errors
      String errorMessage = ErrorHandlingUtils.handleError(error, context);
      ErrorHandlingUtils().showErrorDialog(context, errorMessage);
      return null;
    }
    /*  catch (e) {
      EasyLoading.dismiss();
      print('error');
    } */
  }
}

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // add custom header to request
    options.headers['Custom-Header'] = 'custom value';
    super.onRequest(options, handler);
  }
}

// LoggingInterceptor logs the request and response data
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('Sending method: ${options.method}');
    debugPrint('Sending request url: ${options.uri}');
    debugPrint('Sending request data: ${options.data}');
    debugPrint('Sending request params: ${options.queryParameters}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('Received response: ${response.data}');
    super.onResponse(response, handler);
  }
}
