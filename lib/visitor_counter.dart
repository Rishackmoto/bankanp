import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VisitorCounter extends StatefulWidget {
  const VisitorCounter({super.key});

  @override
  State<VisitorCounter> createState() => _VisitorCounterState();
}

class _VisitorCounterState extends State<VisitorCounter> {
  int? _count;

  @override
  void initState() {
    super.initState();
    _getVisitorCount();
  }

  Future<void> _getVisitorCount() async {
    final url = Uri.parse('https://api.countapi.xyz/hit/bankanp.com/visitors');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _count = data['value'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _count == null ? 'Memuat...' : 'Jumlah pengunjung: $_count',
      style: const TextStyle(fontSize: 16),
    );
  }
}
