import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:dio/src/response.dart' as Res;

import '../constants.dart';

class NetworkManager extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }
}

Future<Dio> reqApi() async {
  var options = BaseOptions(
    baseUrl: KEY_BASE_URL,
    contentType: 'application/json',
    connectTimeout: Duration(seconds: CONNECT_TIMEOUT),
    receiveTimeout: Duration(seconds: RECEIVE_TIMEOUT),
  );

  Dio dio = Dio(options);

  dio.interceptors.clear();
  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioException dioError,
      ErrorInterceptorHandler errorInterceptorHandler) async {
    if (dioError.response?.statusCode == 200) {
    } else {
      return errorInterceptorHandler.next(dioError);
    }
    return errorInterceptorHandler.next(dioError);
  }));

  return dio;
}

Future<Dio> reqSignin() async {

  var options = BaseOptions(
    baseUrl: await Hive.box(LOCAL_DB).get(API_SIGN_IN, defaultValue: 'fail'),
    headers: {
      // 'Authorization':
      // await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail')
    },
    contentType: 'application/json',
    connectTimeout: Duration(seconds: CONNECT_TIMEOUT),
    // 15s
    receiveTimeout: Duration(seconds: RECEIVE_TIMEOUT), // 10s
  );

  Dio dio = Dio(options);


  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioException dioError,
      ErrorInterceptorHandler errorInterceptorHandler) async {
    if (dioError.response?.statusCode != 200) {
      return errorInterceptorHandler.next(dioError);
    }
    return errorInterceptorHandler.next(dioError);
  }));

  return dio;
}