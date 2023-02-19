import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kathford/languages/language.dart';
import 'package:kathford/screens/StudyMaterial.screen.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNav = 0;
  final PageController _pageController = PageController(initialPage: 0);
  getData() async {
    var y = FirebaseFirestore.instance.collection('faculties').snapshots();
    debugPrint(y.toString());
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localization().appName),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(LineIcons.bell),
            tooltip: "Notifications",
          )
        ],
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width > 500
          ? SizedBox.shrink()
          : NavigationBar(
              selectedIndex: selectedNav,
              onDestinationSelected: ((value) => setState(() {
                    selectedNav = value;
                    _pageController.animateToPage(value,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  })),
              destinations: const [
                NavigationDestination(
                  icon: Icon(LineIcons.home),
                  label: "Home",
                ),
                NavigationDestination(
                  icon: Icon(LineIcons.book),
                  label: "Study Materials",
                ),
                NavigationDestination(
                  icon: Icon(LineIcons.userCircle),
                  label: "My Profile",
                ),
              ],
            ),
      body: Row(
        children: [
          MediaQuery.of(context).size.width <= 500
              ? SizedBox.shrink()
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(18))),
                  ),
                ),
          Expanded(
            child: PageView(
              onPageChanged: ((value) => setState(() {
                    selectedNav = value;
                  })),
              controller: _pageController,
              children: const [
                Icon(LineIcons.home),
                StudyMaterial(),
                Icon(LineIcons.userCircle)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
