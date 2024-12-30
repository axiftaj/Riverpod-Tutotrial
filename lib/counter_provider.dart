// Define a provider
import 'package:riverpod/riverpod.dart';

final counterProvider = StateProvider<int>((ref) {
  return 0;
});
