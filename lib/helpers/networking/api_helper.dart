import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiHelper {
  static ApiHelper? _instance;

  ApiHelper._();

  static ApiHelper get instance {
    _instance ??= ApiHelper._();

    return _instance!;
  }


 
  final Dio _dio = Dio()
    ..interceptors.addAll(kDebugMode
        ? [
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: false,
              compact: false,
              error: true,
              request: true,
            ),
          ]
        : []);

  Options _options(
    Map<String, String>? headers,
  ) {
    return Options(
      contentType: 'application/json',
      followRedirects: false,
      validateStatus: (status) {
        return true;
      },
      headers: {
        'Accept': 'application/json',
       
      },
    );
  }

  

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
   
  }) async {

      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: _options(headers,),
      );
      return response.data;
     
    } 

 

 
}