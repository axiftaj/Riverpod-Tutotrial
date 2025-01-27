import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
// Define a FutureProvider for login
final loginProvider = FutureProvider.family<Map<String, dynamic>, Map<String, String>>((ref, credentials) async {

  try {
    final response = await http.post(
      Uri.parse(''),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(credentials),
    );

    if (response.statusCode == 200) {
      // Parse the response body
      return jsonDecode(response.body);
    } else {
      // Handle errors from the server
      return {'error': 'Login failed. Please check your credentials.'};
    }
  } catch (e) {
    // Handle network or parsing errors
    return {'error': 'An error occurred: $e'};
  }
});
