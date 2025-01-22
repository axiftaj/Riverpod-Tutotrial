import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

final stockPriceProvider = StreamProvider<double>((ref) async* {
  final random = Random();
  double currentPrice = 100.0; // Starting stock price

  // Simulate price updates every second
  while (true) {
    await Future.delayed( const Duration(seconds: 1));
    // Simulate price fluctuation
    currentPrice += random.nextDouble() * 4 - 2; // Random change between -2 and +2
    yield double.parse(currentPrice.toStringAsFixed(2)); // Emit the updated price
  }
});


class StreamProviderExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the stream provider
    final stockPriceAsync = ref.watch(stockPriceProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Real-Time Stock Price')),
      body: Center(
        child: stockPriceAsync.when(
          data: (price) => Text(
            '\$${price.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          loading: () => CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }
}
