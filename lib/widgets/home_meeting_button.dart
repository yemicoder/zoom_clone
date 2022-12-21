import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {

  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeMeetingButton({Key? key,
    required this.onPressed,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                ),
              ]
            ),
            height: 60,
              width: 60,
            child: Icon(
              icon, color: Colors.white, size: 24,
            ),
          ),
          const SizedBox(height: 10,),
          Text(text, style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),),
        ],
      ),
    );
  }
}
