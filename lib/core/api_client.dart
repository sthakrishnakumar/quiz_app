import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/app_constant.dart';

class ApiClient {
  Future request({
    required endpoint,
    String type = 'get',
    Map<String, dynamic> data = const {},
  }) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstant.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          "Accept": 'application/json',
        },
      ),
    );

    try {
      final result = type == 'get'
          ? await dio.get(endpoint)
          : await dio.post(
              endpoint,
              data: data,
            );

      return result.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
