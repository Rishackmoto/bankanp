import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VisitorCounter extends StatefulWidget {
  const VisitorCounter({super.key});

  @override
  State<VisitorCounter> createState() => _VisitorCounterState();
}

class _VisitorCounterState extends State<VisitorCounter> {
  int? visitors;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchVisitors();
  }

  Future<void> fetchVisitors() async {
    try {
      final resp = await http.get(
        Uri.parse('https://api.countapi.xyz/hit/bankanp.com/visitors'),
      );
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body);
        setState(() {
          visitors = data['value']; // nilai hit counter
          loading = false;
        });
      } else {
        setState(() {
          loading = false;
        });
      }
    } catch (e) {
      print('Error fetch visitors: $e');
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Text(
        'Memuat...',
        style: TextStyle(color: Colors.white),
      );
    }
    return Text(
      'Pengunjung: ${visitors ?? 0}',
      style: const TextStyle(color: Colors.white),
    );
  }
}
