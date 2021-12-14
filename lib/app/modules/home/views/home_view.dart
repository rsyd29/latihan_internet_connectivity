import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    ConnectivityResult result = ConnectivityResult.none;

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
            result = await Connectivity().checkConnectivity();

            final color = controller.hasInternet ? Colors.green : Colors.red;

            controller.text =
                controller.hasInternet ? 'Internet' : 'No Internet';

            if (result == ConnectivityResult.mobile) {
              showSimpleNotification(
                Text(
                  '${controller.text}: Mobile Network',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                background: color,
              );
            } else if (result == ConnectivityResult.wifi) {
              showSimpleNotification(
                Text(
                  '${controller.text}: Wifi Network',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                background: color,
              );
            } else {
              showSimpleNotification(
                Text(
                  '${controller.text}: No Network',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                background: color,
              );
            }
          },
        ),
      ),
    );
  }
}
