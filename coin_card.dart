import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final String coin;
  final String price;
  final String currency;

  const CoinCard({super.key, required this.coin, required this.price, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              coin,
              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              '$price $currency',
              style: const TextStyle(color: Colors.amberAccent, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
