import 'package:dio/dio.dart';

class ApiRequest {
  final dio = Dio();

  Future authRequest() async {
    //inlude token
    return await request();
  }

  Future request() async {
    //
  }
}
