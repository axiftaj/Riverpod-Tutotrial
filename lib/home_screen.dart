import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




final counterProvider = StateProvider<int>((ref) => 0);


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CounterWidget(),
    );
  }
}


class CounterWidget extends ConsumerWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch will listen the changes, recommend to suer inside the build widget
    final name = ref.watch(nameProvider);
    //read will only listen one, user outside the build widget
    final nameRead = ref.read(nameProvider);
    return  Scaffold(
      body: Center(
        child: Consumer(
            builder: (context, ref, child){
              return Text(ref.watch(nameProvider).toString());
            },
      ),)
    );
  }
}

// final nameProvider = Provider<String>((ref){
//   return 'Asif Taj' ;
// });


final nameProvider = StateProvider<String>((ref){
  return 'Asif Taj' ;
});