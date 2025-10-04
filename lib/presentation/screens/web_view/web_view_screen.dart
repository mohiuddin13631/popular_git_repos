import 'dart:async';
import 'package:block_structure/presentation/component/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../component/webview_widget.dart';

class WebViewScreen extends StatefulWidget {
  final String redirectUrl;

  const WebViewScreen({
    super.key,
    required this.redirectUrl,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Full Repo"),
      body: MyWebViewWidget(
        redirectUrl: widget.redirectUrl,
      ),
      // floatingActionButton: cancelButton(),
    );
  }

  Future<Map<Permission, PermissionStatus>> permissionServices() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.photos,
      Permission.microphone,
      Permission.mediaLibrary,
      Permission.camera,
      Permission.storage,
    ].request();

    return statuses;
  }
}
