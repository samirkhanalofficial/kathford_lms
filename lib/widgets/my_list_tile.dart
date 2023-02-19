import 'package:flutter/material.dart';

Widget MyListTile({
  required IconData icon,
  required String title,
  required String subtitle,
  required Function onclick,
}) {
  return ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    leading: Icon(icon),
    title: Text(title),
    subtitle: Text(subtitle),
    onTap: () => onclick(),
  );
}
