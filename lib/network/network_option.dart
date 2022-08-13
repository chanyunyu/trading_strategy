import 'package:dio/dio.dart';

import 'network_config.dart';

BaseOptions mainOption = BaseOptions(
    baseUrl: mainServerAddress,
    connectTimeout: const Duration(seconds: 60).inMilliseconds,
    receiveTimeout: const Duration(seconds: 60).inMilliseconds,
    contentType: Headers.formUrlEncodedContentType,
    responseType: ResponseType.json);
