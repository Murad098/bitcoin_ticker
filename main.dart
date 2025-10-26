import 'package:flutter/material.dart';
import 'screens/price_screen.dart';

void main() {
  runApp(const BitcoinTickerApp());
}

class BitcoinTickerApp extends StatelessWidget {
  const BitcoinTickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PriceScreen(),
    );
  }
}
