import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/counter_provider.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(counterProvider);
    return ProviderScope(
      child: Scaffold(
        appBar: AppBar(title: const Text("Riverpod Basics")),
        body: Center(
          child: Text(value.toString()),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              ref.read(counterProvider.notifier).state++;
            }
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

