import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


Future<bool> hasInternetConnection() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  } else {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 10));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    }
  }
}

void onConnectionError(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('لا يوجد اتصال بالإنترنت حاول في وقت اخر'),
      backgroundColor: Colors.teal,
    ),
  );
}

void showIndicator(BuildContext ctx) {
  showDialog(
    context: ctx,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}
