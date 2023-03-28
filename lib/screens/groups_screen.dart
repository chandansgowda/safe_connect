import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:safe_connect/screens/chat_screen.dart';

class GroupsScreen extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggested Communities"),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future:
            db.collection('diseases').doc('AIDS').collection('groups').get(),
        builder: (ctx, snapshot) {
          final List groups = snapshot.data!.docs;
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
              ),
            );
          }
          return ListView(
            children: groups.map((group) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Card(
                  color: Colors.pinkAccent,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(group['dpUrl']),
                    ),
                    title: Text(
                      group['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    subtitle: Text("2145 Members, 12 online"),
                    trailing: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => ChatScreen(group['name'], group['dpUrl'])));
                        },
                        child: Text(
                          "Join Group",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
