import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/message_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Whats App',
      debugShowCheckedModeBanner: false,
      home: MessageScreen(),
    ),
  );
}
