import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/jits_meets_method.dart';

import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMethods _jitsiMethods = JitsiMethods();
  void createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMethods.createMeeting(
        roomName: roomName,
        isAudioMuted: true,
        isVideoMuted: true);
  }

  void joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeMeetingButton(onPressed: () {
                  createNewMeeting();
              },
                icon: Icons.video_call,
                text: 'New Meeting',),

              HomeMeetingButton(onPressed: () {
                joinMeeting(context);
              },
                icon: Icons.add_box_rounded,
                text: 'Join Meeting',),

              HomeMeetingButton(onPressed: () {  },
                icon: Icons.calendar_today,
                text: 'Schedule',),

              HomeMeetingButton(onPressed: () {  },
                icon: Icons.arrow_upward_outlined,
                text: 'Share Screen',),
            ],
          ),

          Expanded(
            child: Center(
                child: Text(
                    "Start/Join a meeting with just a click!!!"
                )
            ),
          )
        ],
      ),
    );
  }
}
