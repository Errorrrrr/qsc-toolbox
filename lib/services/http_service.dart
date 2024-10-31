import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  // 基础 URL
  final String baseUrl;

  // 构造函数
  HttpService({required this.baseUrl});

  // 通用请求方法
  Future<dynamic> request(
    String endpoint, {
    String method = 'GET',
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  })  async {
    final url = Uri.parse('$baseUrl$endpoint');

    // 设置默认的请求头
    final requestHeaders = headers ?? {'Content-Type': 'application/json'};

    try {
      http.Response response;

      // 根据方法选择不同的请求方式
      if (method == 'POST') {
        response =  await http.post(url,
            headers: requestHeaders, body: json.encode(body));
      } else if (method == 'PUT') {
        response =  await http.put(url,
            headers: requestHeaders, body: json.encode(body));
      } else if (method == 'DELETE') {
        response = await http.delete(url, headers: requestHeaders);
      } else {
        response = await http.get(url, headers: requestHeaders);
      }

      // 解析响应
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed request: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('HTTP request error: $e');
    }
  }

  // 发送 GET 请求的快捷方法
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    return request(endpoint, headers: headers);
  }

  // 发送 POST 请求的快捷方法
  Future<dynamic> post(String endpoint,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    return request(endpoint, method: 'POST', headers: headers, body: body);
  }
}
