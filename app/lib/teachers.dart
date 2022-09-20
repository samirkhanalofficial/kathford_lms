import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kathfordlmsvideo/lectures.dart';

class TeachersScreen extends StatefulWidget {
  final String title;
  final data;
  TeachersScreen(this.title, this.data, {Key? key}) : super(key: key);

  @override
  _TeachersScreenState createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  Random random = new Random();
  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Hero(
                      tag: "back",
                      child: Material(
                        child: IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(Icons.arrow_back_ios_new_rounded)),
                      ),
                    ),
                  ],
                ),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: "title",
                    child: Material(
                      child: Text(
                        widget.title.toString() + " Teachers :",
                        style: GoogleFonts.zcoolQingKeHuangYou(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: "subtitle",
                    child: Material(
                      child: Text(
                        "Select a teacher whose lectures you want to view. ",
                        style: GoogleFonts.zcoolQingKeHuangYou(),
                      ),
                    ),
                  ),
                ),
                for (var teachers in widget.data)
                  Card(
                    elevation: 0,
                    child: ListTile(
                      onTap: () => navigate(
                          context,
                          teachers["name"] + "  :  " + widget.title,
                          teachers["videos"]),
                      title: Text(
                        teachers["name"],
                        style: GoogleFonts.zcoolQingKeHuangYou(),
                      ),
                      leading: Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                      subtitle: Text(
                        widget.title,
                        style: GoogleFonts.zcoolQingKeHuangYou(),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ))
    ]);
  }
}

navigate(BuildContext context, String title, var data) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return Lectures(title, data);
  }));
}
