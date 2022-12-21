
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/firestore_method.dart';

class JitsiMethods{
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void createMeeting({
    required String roomName,
    required isAudioMuted,
    required isVideoMuted,
    String username = '',
  }) async {
    try {
      Map<FeatureFlagEnum, bool> featureFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      };
      if (!kIsWeb) {
        // Here is an example, disabling features for each platform
        if (Platform.isAndroid) {
          // Disable ConnectionService usage on Android to avoid issues (see README)
          featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
        } else if (Platform.isIOS) {
          // Disable PIP on iOS as it looks weird
          featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
        }
      }// Limit video resolution to 360p

      String name;

      if(username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }

      var options = JitsiMeetingOptions(
          room: roomName)
        ..userDisplayName = name
        ..userEmail = _authMethods.user.displayName
        ..userAvatarURL = _authMethods.user.photoURL// or .png
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted
        ..featureFlags.addAll(featureFlags);

      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }
}