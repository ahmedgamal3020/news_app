
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {

 static Dio? dio;

 static init(){
   dio=Dio(

   BaseOptions(
     receiveDataWhenStatusError: false,
     baseUrl: 'https://newsapi.org/',
   )
   );
 }
 static Future<Response> getData({
    @required String? url,
    @required Map<String ,dynamic>? query
})async
 {
  return await dio!.get(
      url!,
      queryParameters:query );
 }

}

