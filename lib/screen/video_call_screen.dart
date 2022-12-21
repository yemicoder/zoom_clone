import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/jits_meets_method.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {

  late TextEditingController meetindIdController;
  late TextEditingController nameController;
  AuthMethods _authMethods = AuthMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  JitsiMethods _jitsiMethods = JitsiMethods();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    meetindIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    meetindIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMethods.createMeeting(
        roomName: meetindIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join a meeting"),
        backgroundColor: backgroundColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 1,
              controller: meetindIdController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Enter Room ID"
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              maxLines: 1,
              controller: nameController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "your name here"
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(onPressed: () {
                _joinMeeting();
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                  ),
                  child: const Text('Join Meeting'),),
            ),
            const SizedBox(height: 20,),
            MeetingOption(text: "Mute my audio", isMute: isAudioMuted, onChange: onAudioMuted,),
            MeetingOption(text: "Turn off my video", isMute: isVideoMuted, onChange: onVideoMuted,),
          ],
        ),
      ),
    );
  }

  onAudioMuted(bool? val) {
    setState(() {
        isAudioMuted = val!;
    });
  }

  onVideoMuted(bool? val) {
    setState(() {
        isVideoMuted = val!;
    });
  }
}
