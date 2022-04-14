import 'dart:convert';
import 'dart:developer';

void tryCatch(Function? f) {
  try {
    f?.call();
  } catch (e, stack) {
    log('$e');
    log('$stack');
  }
}

class FFConvert {
  FFConvert._();

  static T? Function<T extends Object?>(dynamic value) convert =
      <T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return json.decode(value.toString()) as T?;
  };
}

T? asT<T extends Object?>(dynamic value, [T? defaultValue]) {
  if (value is T) {
    return value;
  }
  try {
    if (value != null) {
      final String valueS = value.toString();
      if ('' is T) {
        return valueS as T;
      } else if (0 is T) {
        return int.parse(valueS) as T;
      } else if (0.0 is T) {
        return double.parse(valueS) as T;
      } else if (false is T) {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return FFConvert.convert<T>(value);
      }
    }
  } catch (e, stackTrace) {
    log('asT<$T>', error: e, stackTrace: stackTrace);
    return defaultValue;
  }

  return defaultValue;
}

class DataRoot {
  DataRoot({
    required this.maUplod,
    required this.pngData,
    required this.txtData,
    required this.zipData,
  });

  factory DataRoot.fromJson(Map<String, dynamic> json) {
    final List<String>? pngData = json['png_data'] is List ? <String>[] : null;
    if (pngData != null) {
      for (final dynamic item in json['png_data']!) {
        if (item != null) {
          tryCatch(() {
            pngData.add(asT<String>(item)!);
          });
        }
      }
    }

    final List<String>? txtData = json['txt_data'] is List ? <String>[] : null;
    if (txtData != null) {
      for (final dynamic item in json['txt_data']!) {
        if (item != null) {
          tryCatch(() {
            txtData.add(asT<String>(item)!);
          });
        }
      }
    }

    final List<String>? zipData = json['zip_data'] is List ? <String>[] : null;
    if (zipData != null) {
      for (final dynamic item in json['zip_data']!) {
        if (item != null) {
          tryCatch(() {
            zipData.add(asT<String>(item)!);
          });
        }
      }
    }
    return DataRoot(
      maUplod: MaUplod.fromJson(asT<Map<String, dynamic>>(json['ma_uplod'])!),
      pngData: pngData!,
      txtData: txtData!,
      zipData: zipData!,
    );
  }

  MaUplod maUplod;
  List<String> pngData;
  List<String> txtData;
  List<String> zipData;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ma_uplod': maUplod,
        'png_data': pngData,
        'txt_data': txtData,
        'zip_data': zipData,
      };
}

class MaUplod {
  MaUplod({
    required this.md5,
  });

  factory MaUplod.fromJson(Map<String, dynamic> json) => MaUplod(
        md5: asT<String>(json['MD5'])!,
      );

  String md5;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'MD5': md5,
      };
}
