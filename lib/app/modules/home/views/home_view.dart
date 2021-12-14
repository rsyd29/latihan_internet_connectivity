import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Connectivity'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Check Internet'),
          onPressed: () async {
            controller.hasInternet = await controller.checkInternet();

            final color = controller.hasInternet ? Colors.green : Colors.red;

            controller.text =
                controller.hasInternet ? 'Internet' : 'No Internet';

            showSimpleNotification(
              Text(
                '${controller.text}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              background: color,
            );
          },
        ),
      ),
    );
  }
}
