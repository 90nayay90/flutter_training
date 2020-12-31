import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../api/jadwal_sholat.dart';
import '../models/jadwal_sholat.dart';

class JadwalSholatSurabaya extends StatefulWidget {
  JadwalSholatSurabaya({Key key}) : super(key: key);

  @override
  _JadwalSholatSurabayaState createState() => _JadwalSholatSurabayaState();
}

class _JadwalSholatSurabayaState extends State<JadwalSholatSurabaya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jadwal Sholat Surabaya"),
      ),
      body: buildBody(),
    );
  }
}

buildBody() {
  final tanggal = DateTime.now();
  return FutureBuilder<Response>(
    future: jadwalSholatApi
        .get('surabaya/${tanggal.year}/${tanggal.month}/${tanggal.day}.json'),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      var data = json.decode(snapshot.data.data);
      var jadwal = Jadwal.fromJson(data);
      return Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Tanggal : " +
                  jadwal.tanggal.day.toString() +
                  "-" +
                  jadwal.tanggal.month.toString() +
                  "-" +
                  jadwal.tanggal.year.toString()),
              SizedBox(
                height: 8.0,
              ),
              Text("IMSYAK"),
              Text(jadwal.imsyak),
              SizedBox(
                height: 8.0,
              ),
              Text("SUBUH"),
              Text(jadwal.shubuh),
              SizedBox(
                height: 8.0,
              ),
              Text("TERBIT"),
              Text(jadwal.terbit),
              SizedBox(
                height: 8.0,
              ),
              Text("DZUHUR"),
              Text(jadwal.dzuhur),
              SizedBox(
                height: 8.0,
              ),
              Text("ASHR"),
              Text(jadwal.ashr),
              SizedBox(
                height: 8.0,
              ),
              Text("MAGRIB"),
              Text(jadwal.magrib),
              SizedBox(
                height: 8.0,
              ),
              Text("ISYA"),
              Text(jadwal.isya),
            ],
          ),
        ),
      );
    },
  );
}
