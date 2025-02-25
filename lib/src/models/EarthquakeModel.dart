import 'package:json_annotation/json_annotation.dart';

part 'EarthquakeModel.g.dart';

@JsonSerializable()
class Earthquake {
  final String type;
  final Properties properties;
  final Geometry geometry;
  final String id;

  Earthquake({
    required this.type,
    required this.properties,
    required this.geometry,
    required this.id,
  });

  factory Earthquake.fromJson(Map<String, dynamic> json) => _$EarthquakeFromJson(json);
  Map<String, dynamic> toJson() => _$EarthquakeToJson(this);
}

@JsonSerializable()
class Properties {
  final double mag;
  final String place;
  final int time;
  final int updated;
  final String? tz;
  final String url;
  final String detail;
  final int? felt;
  final double? cdi;
  final double? mmi;
  final String? alert;
  final String status;
  final int tsunami;
  final int sig;
  final String net;
  final String code;
  final String ids;
  final String sources;
  final String types;
  final int? nst;
  final double? dmin;
  final double? rms;
  final int? gap;
  final String magType;
  final String type;
  final String title;

  Properties({
    required this.mag,
    required this.place,
    required this.time,
    required this.updated,
    this.tz,
    required this.url,
    required this.detail,
    this.felt,
    this.cdi,
    this.mmi,
    this.alert,
    required this.status,
    required this.tsunami,
    required this.sig,
    required this.net,
    required this.code,
    required this.ids,
    required this.sources,
    required this.types,
    this.nst,
    this.dmin,
    this.rms,
    this.gap,
    required this.magType,
    required this.type,
    required this.title,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        mag: (json['mag'] as num?)?.toDouble() ?? 0.0, // Handle null
        place: json['place'] as String,
        time: (json['time'] as num).toInt(),
        updated: (json['updated'] as num).toInt(),
        tz: json['tz'] as String?,
        url: json['url'] as String,
        detail: json['detail'] as String,
        felt: (json['felt'] as num?)?.toInt(), // Nullable
        cdi: (json['cdi'] as num?)?.toDouble(), // Nullable
        mmi: (json['mmi'] as num?)?.toDouble(), // Nullable
        alert: json['alert'] as String?,
        status: json['status'] as String,
        tsunami: (json['tsunami'] as num).toInt(),
        sig: (json['sig'] as num).toInt(),
        net: json['net'] as String,
        code: json['code'] as String,
        ids: json['ids'] as String,
        sources: json['sources'] as String,
        types: json['types'] as String,
        nst: (json['nst'] as num?)?.toInt(), // Nullable
        dmin: (json['dmin'] as num?)?.toDouble(), // Nullable
        rms: (json['rms'] as num?)?.toDouble(), // Nullable
        gap: (json['gap'] as num?)?.toInt(), // Nullable
        magType: json['magType'] as String,
        type: json['type'] as String,
        title: json['title'] as String,
      );

  Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable()
class Geometry {
  final String type;
  final List<double> coordinates;

  Geometry({
    required this.type,
    required this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json['type'] as String,
        coordinates: (json['coordinates'] as List<dynamic>)
            .map((e) => (e as num?)?.toDouble() ?? 0.0) // Handle null
            .toList(),
      );

  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}
