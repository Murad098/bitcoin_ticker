import 'dart:convert';
import 'package:http/http.dart' as http;

class CoinData {
  final String url = 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,litecoin&vs_currencies=usd';

  Future<Map<String, dynamic>> getCoinData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw 'Failed to load coin data';
    }
  }
}
