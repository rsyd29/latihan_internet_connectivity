import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    OverlaySupport.global(
      child: GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}
