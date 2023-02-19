import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kathford/widgets/my_list_tile.dart';
import 'package:line_icons/line_icons.dart';

class StudyMaterial extends StatefulWidget {
  const StudyMaterial({super.key});

  @override
  State<StudyMaterial> createState() => _StudyMaterialState();
}

class _StudyMaterialState extends State<StudyMaterial> {
  List resources = [
    {
      "title": "Syllabus",
      "subtitle": "view your syllabus",
      "icon": LineIcons.list
    },
    {
      "title": "Past Questions",
      "subtitle": "view your syllabus",
      "icon": LineIcons.edit
    },
    {
      "title": "Notes",
      "subtitle": "view your syllabus",
      "icon": LineIcons.leanpub
    },
    {
      "title": "Course Lectures",
      "subtitle": "view your syllabus",
      "icon": LineIcons.youtube
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(8),
      children: [
        Text(
          "Resources",
          style: GoogleFonts.breeSerif(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
        ),
        const Text(
          "Please choose your Resources.",
        ),
        const SizedBox(
          height: 10,
        ),
        for (var item in resources)
          MyListTile(
            icon: item["icon"],
            title: item["title"],
            subtitle: item["subtitle"],
            onclick: () {
              GoRouter.of(context).push("/faculty");
            },
          ),
      ],
    );
  }
}
