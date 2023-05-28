import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../view_model/controllers/google_controller.dart';

class GoogleView extends GetView<GoogleController> {
  const GoogleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GoogleView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GoogleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
