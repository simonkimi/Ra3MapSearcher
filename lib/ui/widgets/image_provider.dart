import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'package:ra3_map_searcher/data/global_controller.dart';

class DioImageProvider extends ImageProvider<DioImageProvider> {
  DioImageProvider({
    required this.url,
    required this.dio,
    this.scale = 1.0,
  });

  final Dio dio;
  final String url;
  final double scale;

  final _cancelToken = CancelToken().obs;

  @override
  ImageStreamCompleter load(DioImageProvider key, DecoderCallback decode) {
    final StreamController<ImageChunkEvent> chunkEvents =
        StreamController<ImageChunkEvent>();
    return MultiFrameImageStreamCompleter(
      chunkEvents: chunkEvents.stream,
      codec: _loadAsync(key, decode, chunkEvents),
      scale: key.scale,
      debugLabel: url,
      informationCollector: () {
        return <DiagnosticsNode>[
          DiagnosticsProperty<ImageProvider>('Image provider', this),
          DiagnosticsProperty<DioImageProvider>('Image key', key),
        ];
      },
    );
  }

  Future<ui.Codec> _loadAsync(DioImageProvider key, DecoderCallback decode,
      StreamController<ImageChunkEvent> chunkEvents) async {
    final rsp = await dio.get<Uint8List>(
      url,
      cancelToken: _cancelToken.value,
      onReceiveProgress: (r, t) => chunkEvents.add(ImageChunkEvent(
        cumulativeBytesLoaded: r,
        expectedTotalBytes: t,
      )),
      options: Get.find<GlobalController>()
          .cacheOptions
          .copyWith(policy: CachePolicy.forceCache)
          .toOptions()
          .copyWith(responseType: ResponseType.bytes),
    );
    if (rsp.data == null || rsp.data!.isEmpty) {
      throw StateError('$url is empty and cannot be loaded as an image.');
    }
    return await decode(rsp.data!);
  }

  @override
  Future<DioImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<DioImageProvider>(this);
  }

  void cancel() => _cancelToken.value.cancel();
}
