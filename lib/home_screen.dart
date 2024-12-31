import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/counter_provider.dart';

import 'package:riverpod/riverpod.dart';

final counterProvider = StateProvider<int>((ref) {
  return  0 ;
});

final switchProvider = StateProvider<bool>((ref) {
  return  false ;
});

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App with Riverpod'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 16),
            ),
            Consumer(
                builder: (context, ref, child){
                  final counter = ref.watch(counterProvider);
                  return Text(
                    '$counter',
                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  );
                }
            ),
            Consumer(
                builder: (context, ref, child){
                  final counter = ref.watch(switchProvider);
                  return Switch(value: counter, onChanged: (value){
                    ref.read(switchProvider.notifier).state = value;
                  });
                }
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).state++;
                  },
                  child: const Text('+'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).state--;
                  },
                  child: const Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}

// class HomePage extends ConsumerWidget  {
//   @override
//   Widget build(BuildContext context , WidgetRef ref) {
//     final value = ref.watch(greetingProvider);
//     return ProviderScope(
//       child: Scaffold(
//         appBar: AppBar(title: const Text("Riverpod Basics")),
//         body: Center(
//           child: Text(value),
//         ),
//       ),
//     );
//   }
// }

