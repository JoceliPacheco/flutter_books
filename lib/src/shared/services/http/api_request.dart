import 'package:dio/dio.dart';
import 'package:flutter_books/src/shared/models/dominio/api_url_method.dart';

class ApiRequest {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(minutes: 2),
      receiveTimeout: const Duration(minutes: 1),
      sendTimeout: const Duration(minutes: 1),
    ),
  );

  Future request(
    ApiUrlMethod api, {
    data,
    query,
  }) async {
    Options requestOptions = Options(
      method: api.httpMethod,
      contentType: "application/json",
      validateStatus: (int? status) {
        return status! < 400;
      },
    );

    print('path: ${api.path}');

    try {
      Response response = await dio.request(
        api.url,
        data: data,
        options: requestOptions,
        queryParameters: query,
      );

      return response.data;
    } catch (error) {
      throw Exception(error);
    }
  }
}
