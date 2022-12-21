import 'package:flutter/material.dart';
import 'package:zoom_clone/screen/history_meeting_screen.dart';
import 'package:zoom_clone/screen/meeting_screen.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
      setState(() {
        _page = page;
      });
  }

  List<Widget> pages = [
      MeetingScreen(),
      const HistoryMeetingScreen(),
      const Center(child: Text("Contacts"),),
      const Center(child: Text("Settings"),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meet & Chat"),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor:  Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: onPageChanged,
        iconSize: 18,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: _page,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.comment_bank), label: "Meet & Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.lock_clock), label: "Meetings"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Settings"),
        ],
      ),
    );
  }
}
