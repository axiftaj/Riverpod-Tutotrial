import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/provider/login_provider.dart';


class LoginScreen extends ConsumerWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final credentials = {
                  'username': usernameController.text,
                  'password': passwordController.text,
                };

                ref.refresh(loginProvider(credentials)); // Trigger the provider
              },
              child: Text('Login'),
            ),
            Consumer(
              builder: (context, ref, child) {
                final loginResult = ref.watch(loginProvider({
                  'username': usernameController.text,
                  'password': passwordController.text,
                }));

                return loginResult.when(
                  data: (data) {
                    if (data.containsKey('error')) {
                      return Text(data['error'], style: TextStyle(color: Colors.red));
                    } else {
                      return Text('Welcome, ${data['username']}!');
                    }
                  },
                  loading: () => CircularProgressIndicator(),
                  error: (error, stackTrace) => Text('Error: $error'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
