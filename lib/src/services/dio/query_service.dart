import 'base_service.dart';
import 'package:dio/dio.dart';

class QueryService extends BaseService {
  // ฟังก์ชันเพื่อดึงข้อมูล Earthquake
  Future<Response> getEarthquakeData(
    String? startTime,
    String? endTime, {
    int? min,
  }) async {
    final response = await get(
      '/query',
      queryParameters: {
        'format': 'geojson',
        'starttime': startTime,
        'endtime': endTime,
        'minmagnitude': min,
      },
    );
    return response;
  }

  Future<Response> getEarthquakeCountData(
    String startTime,
    String endTime, {
    String? format,
  }) async {
    final response = await get(
      '/count',
      queryParameters: {
        'format': format,
        'starttime': startTime,
        'endtime': endTime,
      },
    );
    return response;
  }

  Future<Response> getEarthquakeVersionData(
    String startTime,
    String endTime, {
    String? format,
  }) async {
    final response = await get(
      '/version',
      queryParameters: {
        'format': format,
        'starttime': startTime,
        'endtime': endTime,
      },
    );
    return response;
  }
}
