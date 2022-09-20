import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kathfordlmsvideo/VideoPlayer.dart';
import 'package:url_launcher/url_launcher.dart';

class Lectures extends StatefulWidget {
  final data;
  final String title;
  Lectures(this.title, this.data, {Key? key}) : super(key: key);

  @override
  _LecturesState createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
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
            body: widget.data.length < 1
                ? Text("no data found / internet error")
                : ListView(
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
                          height: 200,
                          child: Hero(
                              tag: "logo",
                              child: Material(
                                  child:
                                      Image.asset("assets/ic_launcher.png"))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Hero(
                          tag: "title",
                          child: Material(
                            child: Text(
                              widget.title,
                              style:
                                  GoogleFonts.zcoolQingKeHuangYou(fontSize: 30),
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
                              "Pick the Lecture you want you study. ",
                              style: GoogleFonts.zcoolQingKeHuangYou(),
                            ),
                          ),
                        ),
                      ),
                      for (var currentdata in widget.data)
                        Card(
                          elevation: 0,
                          child: ListTile(
                            onTap: () {
                              navigate(
                                  context,
                                  currentdata["title"] + "  :  " + widget.title,
                                  currentdata["videoId"]);
                            },
                            title: Text(
                              currentdata["title"]
                                  .toString()
                                  .split(" - ")[0]
                                  .toString(),
                              style: GoogleFonts.zcoolQingKeHuangYou(),
                            ),
                            leading: Icon(Icons.document_scanner),
                            subtitle: Text(
                              widget.title,
                              style: GoogleFonts.zcoolQingKeHuangYou(),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        )
                    ],
                  ),
          ))
    ]);
  }
}

navigate(BuildContext context, String title, String id) {
  launch("https://player.vimeo.com/video/$id?loop=0&autoplay=1");
}
