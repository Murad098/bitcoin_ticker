import 'package:flutter/material.dart';
import '../services/coin_data.dart';
import '../widgets/coin_card.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'AUD';
  Map<String, String> coinPrices = {
    'BTC': '?',
    'ETH': '?',
    'LTC': '?',
  };
  List<String> currencies = ['AUD', 'USD', 'EUR'];

  void getCoinData() async {
    var data = await CoinData().getCoinData();
    setState(() {
      coinPrices['BTC'] = data['bitcoin']['usd'].toString();
      coinPrices['ETH'] = data['ethereum']['usd'].toString();
      coinPrices['LTC'] = data['litecoin']['usd'].toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getCoinData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: const Text(
          'Bitcoin Ticker',
          style: TextStyle(
            fontSize: 24,
            color: Colors.orange, // <-- change color here
            fontWeight: FontWeight.bold, // optional
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Column(
          children: [
            // Coin Cards scrollable
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                itemCount: coinPrices.keys.length,
                itemBuilder: (context, index) {
                  String coin = coinPrices.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CoinCard(
                      coin: coin,
                      price: coinPrices[coin]!,
                      currency: selectedCurrency,
                    ),
                  );
                },
              ),
            ),
            // Currency Selector fixed at bottom
            Container(
              color: Colors.grey[850],
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: DropdownButton<String>(
                value: selectedCurrency,
                dropdownColor: Colors.grey[800],
                style: const TextStyle(color: Colors.white, fontSize: 20),
                items: currencies.map((currency) {
                  return DropdownMenuItem(
                    value: currency,
                    child: Text(currency),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
