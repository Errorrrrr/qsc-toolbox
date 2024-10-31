import '../services/http_service.dart';

class OMSApi {
  final httpService = HttpService(baseUrl: 'https://oms.qingsongchou.net');
  Future<Map<String, dynamic>> omsLogin(String userName, password) async {
    try {
      final response = await httpService.post('/new/api/users/login/',
          body: {'username': userName, 'password': password});
      return response;
    } catch (e) {
      throw Exception('OMS login error: $e');
    }
  }
}
