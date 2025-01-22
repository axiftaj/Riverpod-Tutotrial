

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/provider/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: provider.when(
            skipLoadingOnRefresh: false,
            data: (value) => Text(value.toString()),
            error: (error, stack) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){

            ref.invalidate(futureProvider);
          }
      ),
    );
  }
}
