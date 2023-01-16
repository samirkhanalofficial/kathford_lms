import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(8),
      children: [
        Text(
          "Faculty",
          style: GoogleFonts.breeSerif(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
        ),
        const Text(
          "Please choose your faculty.",
        ),
        const SizedBox(
          height: 10,
        ),
        for (int i = 0; i < 15; i++)
          ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            leading: const Icon(LineIcons.leanpub),
            title: const Text("BCT"),
            subtitle: const Text("Bachlore in Engineering"),
            onTap: () {},
          )
      ],
    );
  }
}
