import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart'
    as webview_flutter_android;
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart'
    as webview_flutter_ios;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  await Permission.microphone.request();
  await Permission.location.request();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final prefix = "af99-122-179-207-116.ngrok-free.app";
  final prefix2 = "signup.stoxkart.com";
  final prefix3 = "uatapp.smcindiaonline.org:7443";
  late final url =
      "https://$prefix3/e-kyc/assisted?at=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRfaWQiOiIwOWNhYzQ5ZS0xYzA1LTQyM2ItOWZmNS01NmMzODdkYWVhNDYiLCJkZXZpY2VfaWQiOiI1YTQ0YjYzYi0zZTE0LTRkMDEtOGY1Yi0xMmE4YWJjNmNhMjYiLCJzb3VyY2UiOiJ3ZWIiLCJwYXJ0bmVyX2lkIjoic3RveGthcnQiLCJtb2JpbGVfbnVtYmVyIjoiODQ0NzYzNzMyMiIsImV4cCI6MTY4Njk0OTg5NX0.qNJL2Yq-Mprh4CapBhTRsUeCmqtMvFvFfMD4G4UZo0A&step=selfie_verification&mobile=true";
  final urls = "http://192.168.1.8:4006";
  @override
  void initState() {
    super.initState();
    launchUrl(Uri.parse(url),
        mode: Platform.isAndroid
            ? LaunchMode.externalApplication
            : LaunchMode.platformDefault);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
