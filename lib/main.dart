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
      "https://$prefix3/e-kyc/assisted?at=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRfaWQiOiJkOWM0ZDZkZC02OGI2LTQ4ZDctOTA2YS0yM2M5NzEzM2NiNWIiLCJkZXZpY2VfaWQiOiIxMWJmZjFlMy04NmQ2LTQzZDUtODlkNi05YTQ0NjNiZTM1ZDYiLCJzb3VyY2UiOiJ3ZWIiLCJwYXJ0bmVyX2lkIjoic3RveGthcnQiLCJtb2JpbGVfbnVtYmVyIjoiODQ0NzYzNzMyMiIsImV4cCI6MTY4Njg3ODQzNX0.vil-eJyF3XFZFv8i92sW3eqxWn_fPhw8sliH0f29xGQ&step=selfie_verification&mobile=true";
  final urls = "http://192.168.1.8:4006";
  late final WebViewController _ct;

  Future<List<String>> _pickFile(
      webview_flutter_android.FileSelectorParams params) async {
    final file = await FilePicker.platform.pickFiles();
    print(params.acceptTypes);
    if (file != null) {
      var tempList = <String>[];
      for (var path in file.paths) {
        if (path != null) tempList.add(path);
      }
      return tempList;
    }
    return [];
  }

  @override
  void initState() {
    super.initState();

    _ct = WebViewController.fromPlatformCreationParams(
      const PlatformWebViewControllerCreationParams(),
      onPermissionRequest: (req) {
        req.grant();
      },
    )
      ..loadRequest(Uri.parse(url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    if (_ct.platform is webview_flutter_android.AndroidWebViewController) {
      final a =
          _ct.platform as webview_flutter_android.AndroidWebViewController;
      a.setOnShowFileSelector(_pickFile);
      a.setGeolocationPermissionsPromptCallbacks(
          onShowPrompt: (_) async {
            return const webview_flutter_android.GeolocationPermissionsResponse(
                allow: true, retain: true);
          },
          onHidePrompt: () {});
    }
      if (_ct.platform is webview_flutter_ios.WebKitWebViewController) {
      final a = _ct.platform as webview_flutter_ios.WebKitWebViewController;
      a.setPlatformNavigationDelegate(
        webview_flutter_ios.WebKitNavigationDelegate(
          const PlatformNavigationDelegateCreationParams(),
        )..setOnNavigationRequest((navigationRequest) async {
            return NavigationDecision.navigate;
          }),
      );
    } 
    /*if (Platform.isIOS) {
      launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } */
  }

  @override
  Widget build(BuildContext context) {
    /*if (Platform.isIOS) {
      return Container();
    } */
    return WebViewWidget(
      controller: _ct,
    );
/*    return InAppWebView(
      shouldOverrideUrlLoading: (_, __) async {
        return NavigationActionPolicy.ALLOW;
      },
      onGeolocationPermissionsShowPrompt: (_, origin) async {
        return GeolocationPermissionShowPromptResponse(
            origin: origin, allow: true, retain: true);
      },
      initialUrlRequest: URLRequest(url: WebUri(url)),
      initialOptions: InAppWebViewGroupOptions(
          android: AndroidInAppWebViewOptions(),
          crossPlatform: InAppWebViewOptions(
              javaScriptCanOpenWindowsAutomatically: true,
              mediaPlaybackRequiresUserGesture: false,
              javaScriptEnabled: true),
          ios: IOSInAppWebViewOptions(
              allowsInlineMediaPlayback: true,
              allowsAirPlayForMediaPlayback: true)),
      androidOnPermissionRequest: (InAppWebViewController controller,
          String origin, List<String> resources) async {
        print("--" * 8);
        print(resources);
        print("--" * 8);
        return PermissionRequestResponse(
            resources: resources,
            action: PermissionRequestResponseAction.GRANT);
      },
      onWebViewCreated: (controller) async {
        // webViewController = controller;
      },
    ); */
  }
}
