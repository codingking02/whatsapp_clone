import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_clone/widgets/colors.dart';

Widget messageBubble(Widget message, bool isSender, BuildContext context) {
  return Align(
    alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      padding: const EdgeInsets.all(15),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.65,
      ),
      decoration: BoxDecoration(
        color: isSender ? const Color(0xff232d36) : greenColor,
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(16),
          bottomRight: const Radius.circular(16),
          topLeft: Radius.circular(isSender ? 16 : 0),
          topRight: Radius.circular(isSender ? 0 : 16),
        ),
      ),
      child: message,
    ),
  );
}

Widget getTextMessage(String text) {
  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      height: 1.2,
    ),
    textDirection: TextDirection.ltr,
  );
}
