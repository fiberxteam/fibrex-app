import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ServicePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ServicePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
