import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:kathfordlmsvideo/teachers.dart';
import 'package:shimmer/shimmer.dart';

String url =
    "https://raw.githubusercontent.com/samirlure161/kathford_lms/main/test.json";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kathfordlmsvideo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data = [];
  var _isloading = true;
  loaddata() async {
    _isloading = true;
    data = [];
    setState(() {});
    try {
      var res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        var dataa = await jsonDecode(res.body);
        data = dataa[0]["semisters"][0]["data"];
      }
      _isloading = false;
    } catch (e) {
      print("error : " + e.toString());
      _isloading = false;
    }

    setState(() {});
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Row(
      children: [
        Expanded(
          child: Container(
            child: Image.asset("assets/happy.jpg"),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width > 411
              ? 411
              : MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Scaffold(
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                // ElevatedButton(
                //     onPressed: () {
                //       loaddata();
                //     },
                //     child: Text("reload")),
                Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: Container(
                    height: 150,
                    child: Hero(
                        tag: "logo",
                        child: Material(
                            child: Image.asset("assets/ic_launcher.png"))),
                  ),
                ),
                data.length < 1
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Hero(
                          tag: "title",
                          child: Material(
                            child: Text(
                              "Subjects : ",
                              style:
                                  GoogleFonts.zcoolQingKeHuangYou(fontSize: 30),
                            ),
                          ),
                        ),
                      ),
                data.length < 1
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Hero(
                          tag: "subtitle",
                          child: Material(
                            child: Text(
                              "Select a subject you want you study. ",
                              style: GoogleFonts.zcoolQingKeHuangYou(),
                            ),
                          ),
                        ),
                      ),
                _isloading
                    ? Container(
                        child: Column(
                          children: [
                            for (int i = 0; i < 5; i++)
                              Shimmer(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: ListTile(
                                      leading: Container(
                                        width: 50,
                                        height: 50,
                                        color: Colors.grey,
                                      ),
                                      title: Container(
                                        height: 20,
                                        color: Colors.grey.shade700,
                                      ),
                                      subtitle: Container(
                                        height: 10,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white10,
                                    Colors.grey.shade400,
                                  ],
                                ),
                              ),
                          ],
                        ),
                      )
                    : data.length != 0
                        ? SizedBox()
                        : Column(
                            children: [
                              Image.asset("assets/error_internet.jpg"),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "No Internet Connection ",
                                  style: GoogleFonts.zcoolQingKeHuangYou(
                                      fontSize: 30),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Please check your internet connection and try again ",
                                  style: GoogleFonts.zcoolQingKeHuangYou(),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isloading = true;
                                    });
                                    loaddata();
                                  },
                                  child: Text("Reload"))
                            ],
                          ),
                for (var dat in data)
                  Card(
                    elevation: 0,
                    child: ListTile(
                      onTap: () =>
                          navigate(context, dat["subject"], dat["teacher"]),
                      title: Text(dat!["subject"].toString() + "",
                          style: GoogleFonts.zcoolQingKeHuangYou()),
                      leading: Icon(Icons.document_scanner),
                      subtitle: Text("first sem",
                          style: GoogleFonts.zcoolQingKeHuangYou()),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: Text(
                    "Developed by BCT batch 2077",
                    style: GoogleFonts.zcoolQingKeHuangYou(),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

navigate(BuildContext context, String title, var data) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return TeachersScreen(title, data);
  }));
}
