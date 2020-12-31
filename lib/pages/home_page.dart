import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txtPesan = TextEditingController();
  String pesan = "Hello World";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Saya"),
      ),
      body: Container(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/image1.png",
                  height: 800,
                ),
                Text(
                  pesan,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                RaisedButton.icon(
                  icon: Icon(CupertinoIcons.paperplane),
                  label: Text("Ubah Variable"),
                  onPressed: () {
                    setState(() {
                      pesan = "Hello Kitty";
                    });
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
                TextField(
                  controller: txtPesan,
                  decoration: InputDecoration(
                    labelText: "Nilai",
                    hintText: "Masukkan nilai",
                    prefixText: "Rp ",
                    suffixText: "Juta",
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Masukkan nilai",
                  ),
                  obscureText: true,
                ),
                RaisedButton(
                  child: Text("Set Text Pesan Ke Default"),
                  onPressed: () {
                    setState(() {
                      pesan = txtPesan.text;
                    });
                  },
                ),
                RaisedButton(
                  child: Text("Set Text Clear"),
                  onPressed: () {
                    txtPesan.text = "Apa sih?";
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  child: Text("Profile Page"),
                  // onPressed: () {
                  //   Navigator.pushNamed(context, "/profile").then((value) {
                  //     txtPesan.text = value;
                  //   });
                  // },
                  onPressed: () async {
                    var value = await Navigator.pushNamed(context, "/profile");
                    if (value is Map) {
                      setState(() {
                        txtPesan.text = value["pesan1"];
                        pesan = value["pesan2"];
                      });
                    }
                  },
                ),
                RaisedButton(
                  child: Text("Settings Page"),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/settings",
                      arguments: <String, String>{
                        "pesan1": txtPesan.text,
                      },
                    );
                  },
                ),
                RaisedButton(
                  child: Text("Products Page"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/products");
                  },
                ),
                RaisedButton(
                  child: Text("Jadwal Sholat Surabaya"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/jadwal_sholat_surabaya");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
