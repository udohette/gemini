import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../view_model/controllers/bing_controller.dart';

class BingView extends GetView<BingController> {
  const BingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
