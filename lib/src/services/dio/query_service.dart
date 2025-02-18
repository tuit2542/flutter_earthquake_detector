import 'package:flutter_earthquake_detector/src/shared/helpers/enum.dart';

import 'base_service.dart';
import 'package:dio/dio.dart';

class QueryService extends BaseService {
  // ฟังก์ชันเพื่อดึงข้อมูล Earthquake
  Future<Response> getEarthquakeData(
    String? startTime,
    String? endTime, {
    int? min,
    EarthquakeOrderBy orderby = EarthquakeOrderBy.time,
    AlertLevel? alertLevel,
    FormatType formatType = FormatType.geojson,
  }) async {
    final response = await get(
      '/query',
      queryParameters: {
        'format': formatType.value,
        'starttime': startTime,
        'endtime': endTime,
        'minmagnitude': min,
        'orderby': orderby.value,
        'alertlevel': alertLevel?.value,
      },
    );
    return response;
  }

  Future<Response> getEarthquakeCountData(
    String startTime,
    String endTime, {
    int? min,
    FormatType formatType = FormatType.text,
  }) async {
    final response = await get(
      '/count',
      queryParameters: {
        'format': formatType.value,
        'starttime': startTime,
        'endtime': endTime,
        'minmagnitude': min,
      },
    );
    return response;
  }

  Future<Response> getEarthquakeVersionData(
    String startTime,
    String endTime, {
    FormatType formatType = FormatType.text,
  }) async {
    final response = await get(
      '/version',
      queryParameters: {
        // 'format': formatType.value,
        'starttime': startTime,
        'endtime': endTime,
      },
    );
    return response;
  }
}
