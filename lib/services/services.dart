import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo_model.dart';

class Apiservices {
  final String endpoint =
      'https://todo-list-api-mfchjooefq-as.a.run.app/todo-list';
  final Dio _dio = Dio(BaseOptions(responseType: ResponseType.json));
  Future<List<Todo>> getTodoData(
      int pageStart, int pageEnd, bool isAsc, String status) async {
    Map<String, dynamic> query = {
      'offset': pageStart,
      'limit': pageEnd,
      'sortBy': "createdAt",
      'isAsc': isAsc,
      'status': status
    };
    try {
      Response response = await _dio.get(endpoint, queryParameters: query);
      
      if (response.statusCode == 200) {
        var itemData = response.data['tasks'] as List;
        List<Todo> dataList = itemData.map((e) => Todo.fromJson(e)).toList();
        return dataList;
      } else {
        throw Exception(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout) {
        throw Exception("Connection Timeout Exception");
      }
      throw Exception(e.message);
    }
  }
}

final todoProvider = Provider((ref) => Apiservices());
