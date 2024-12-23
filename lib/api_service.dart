import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<List<dynamic>> fetchCryptos() async {
    final response = await http.get(
      Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('gagal mengambil data');
    }
  }
}