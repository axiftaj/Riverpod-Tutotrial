import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/provider/counter_provider.dart';

class SliderScreen extends ConsumerWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(builder: (context, ref, child){

            final slider = ref.watch(sliderProvider.select((state) => state.showPassword));
            return IconButton(onPressed: (){
              final stateProvider =  ref.read(sliderProvider.notifier);
              stateProvider.state = stateProvider.state.copyWith(showPassword: !slider) ;
            }, icon:  Icon( slider ?  Icons.remove_red_eye : Icons.hide_image));
          }),

          Consumer(builder: (context, ref, child){
            print('slider chaning');

            final slider = ref.watch(sliderProvider.select((state) => state.slider));
            return Container(
              height: 200,
              width: 200,
              color: Colors.red.withOpacity(slider),
            );
          }),
          Consumer(builder: (context, ref, child){
            final slider = ref.watch(sliderProvider);
            return Slider(value: slider.slider, onChanged: (value){

              final stateProvider =  ref.read(sliderProvider.notifier);
              stateProvider.state = ref.read(sliderProvider.notifier).state.copyWith(slider: value) ;
            });
          }),

        ],
      ),
    );
  }
}
