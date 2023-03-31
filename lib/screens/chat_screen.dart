import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';


class ChatScreen extends StatefulWidget {
  final String groupName;

  ChatScreen(this.groupName);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  final db = FirebaseFirestore.instance;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text(widget.groupName),
        ),
        body: StreamBuilder(
            stream: db.collection('diseases').doc('AIDS').collection('groups')
                .doc(
                '4x738Rb3bzzIWui7KYqB').collection('messages')
                .snapshots(),
            builder: (context, snapshot) {
              List<DocumentSnapshot> messageDocs;
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Text('Firestore Connection error');
              }
              else {
                messageDocs = snapshot.data!.docs;
                List<types.Message> messages = [];
                messageDocs.forEach((mDoc) {
                  messages.add(types.TextMessage(
                    author: types.User(id: mDoc['author']),
                    createdAt: DateTime
                        .now()
                        .millisecondsSinceEpoch,
                    id: const Uuid().v4(),
                    text: mDoc["text"],
                  ));
                });
                print(messageDocs);
                return Chat(
                  messages: messages,
                  onAttachmentPressed: _handleImageSelection,
                  onSendPressed: _handleSendPressed,
                  showUserAvatars: true,
                  showUserNames: true,
                  user: types.User(id: user.uid),
                );
              }
            }
        ),
      );

  void _addMessage(types.Message message) {
    db.collection('diseases').doc('AIDS').collection('groups').doc(
        '4x738Rb3bzzIWui7KYqB').collection('messages').add({
      "author": message.author.id,
      "text": message.toJson()["text"],
      "createdAt": DateTime.fromMillisecondsSinceEpoch(message.createdAt!),
      "id": const Uuid().v4()
    });
  }


  void _handleImageSelection() async {
    //TODO: Implement this feature
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac'),
        createdAt: DateTime
            .now()
            .millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }


  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: types.User(id: user.uid),
      createdAt: DateTime
          .now()
          .millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

}
