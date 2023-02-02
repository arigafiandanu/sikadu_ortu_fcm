import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/informasi_lainnya_controller.dart';

class InformasiLainnyaView extends GetView<InformasiLainnyaController> {
  const InformasiLainnyaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InformasiLainnyaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'InformasiLainnyaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
