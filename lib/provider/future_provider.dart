


// Define a FutureProvider
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>((ref) async {
  print('i am here');
  // Simulate a network request with a delay
  await Future.delayed(const Duration(seconds: 2));
  return  3;
});
