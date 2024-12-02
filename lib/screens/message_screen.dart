import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/model/message_model.dart';
import 'package:whatsapp_clone/widgets/colors.dart';
import 'package:whatsapp_clone/widgets/images.dart';
import 'package:whatsapp_clone/widgets/message_container.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        myMessage.add(WhatsAppMesaage(Image.file(_image!), true));
      });
    }
  }

  List<WhatsAppMesaage> myMessage = [
    WhatsAppMesaage(
      getTextMessage('Hello!'),
      false,
    ),
    WhatsAppMesaage(
      getTextMessage('Hello!'),
      true,
    ),
    WhatsAppMesaage(
      getTextMessage(
        'Hey! Have you ever thought about how random moments can sometimes turn into the best memories? It’s like the universe loves to surprise us when we least expect it!',
      ),
      false,
    ),
    WhatsAppMesaage(
      Image.asset('assets/route.png'),
      false,
    ),
    WhatsAppMesaage(
      getTextMessage('what a Great Content Tp learn Flutter'),
      true,
    ),
  ];
  final messageController = TextEditingController();
  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          getSvgImage('phone'),
          const SizedBox(
            width: 15,
          ),
          getSvgImage('video'),
          const SizedBox(
            width: 15,
          ),
          getSvgImage('menu'),
          const SizedBox(
            width: 15,
          ),
        ],
        titleSpacing: 0,
        backgroundColor: const Color(0xff168C4B),
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: getSvgImage('arrow-right'),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: getPngImage('avatar'),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'John Safwat',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/background.png',
            ),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width * 0.06,
                  ),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: myMessage.length,
                    itemBuilder: (context, index) {
                      var message = myMessage[index];
                      return messageBubble(
                        message.message,
                        message.isSender,
                        context,
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.03,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: TextField(
                          controller: messageController,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.white,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Type a Message ...',
                            hintStyle: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _pickImage();
                                  });
                                },
                                child: getSvgImage('camera'),
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    myMessage.add(
                                      WhatsAppMesaage(
                                        getTextMessage(messageController.text),
                                        true,
                                      ),
                                    );
                                    messageController.clear();
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 10,
                                ),
                                child: getSvgImage('send'),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greenColor,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(39),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greenColor,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(39),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: greenColor,
                        shape: BoxShape.circle,
                      ),
                      child: getSvgImage('mic'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
