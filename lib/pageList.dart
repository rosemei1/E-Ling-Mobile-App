import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:proto/model/kategori.dart';
import 'package:proto/service/kategoriservice.dart';

class PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  final KategoriService _kategorService = KategoriService();
  List<Kategori> _kategoris = [];

  @override
  void initState() {
    super.initState();
    _loadKategori();
  }

  Future<void> _loadKategori() async {
    final kategoris = await _kategorService.getKategori();
    setState(() {
      _kategoris = kategoris;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _kategoris.length,
      itemBuilder: (context, index) {
        final kategori = _kategoris[index];
        return ListTile(
          title: Text(kategori.jenisKategori),
          onTap: () {
            // Navigate to book detail screen
          },
        );
      },
    );
  }
}
