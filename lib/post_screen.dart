import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_tutorial/provider/post_provider.dart';


class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the stream provider
    final postList = ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Real-Time Stock Price')),
      body: Center(
        child: postList.when(
          data:(data) =>  ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index){
              final item = data[index] ;
              return Card(
                child: ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.body),
                ),
              );
            },
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }
}
