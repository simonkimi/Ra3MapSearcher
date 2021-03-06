import 'dart:convert';

import 'package:dio/dio.dart';

import 'entities.json.dart';

const baseUrl = 'http://47.107.50.177/';

class Client {
  final _dio = Dio()
    ..options.baseUrl = baseUrl;

  Future<DataRoot> getData() async {
    final rsp = await _dio.get<String>('data.json');
    if (rsp.data == null) throw Exception('接收数据失败');
    return DataRoot.fromJson(jsonDecode(rsp.data!));
  }

  Future<Map<String, String>> getDescription(List<String> maps) async {
    final rsp = await _dio.get<String>('txt_get.json');
    if (rsp.data == null) throw Exception('接收描述失败');
    final data = jsonDecode(rsp.data!) as Map<String, dynamic>;
    final maps = data['txt_get'] as Map<String, String>?;
    return maps ?? {};
  }

  Dio get dio => _dio;
}
