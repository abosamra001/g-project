import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkConnectivity() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult == ConnectivityResult.none ? false : true;
}

void onConnectionError(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('لا يوجد اتصال بالإنترنت حاول في وقت اخر'),
      backgroundColor: Colors.teal,
    ),
  );
}
