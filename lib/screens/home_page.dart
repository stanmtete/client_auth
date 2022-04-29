import 'package:auth_app2/sections/drawer_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String email, nickname;
  late String listName;

  // ignore: unused_field
  final String _profileImg =
      'https://cdn.pixabay.com/photo/2022/04/05/20/21/jack-russell-terrier-7114378__340.jpg';

  @override
  Widget build(BuildContext context) {
    var doc = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.email);

    return Scaffold(
      drawer: drawer(doc),
      appBar: AppBar(
        title: const Text('Client Auth UI'),
        actions: [
          IconButton(
            onPressed: () async {
              await auth.signOut().whenComplete(
                    () => Navigator.of(context).pop(),
                  );
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          )
        ],
      ),
      body: const Center(
        child: Text('Some Logic here '),
      ),
    );
  }

  Drawer drawer(doc) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: CircleAvatar(
              backgroundImage: NetworkImage(_profileImg),
              child: Align(
                alignment: Alignment.bottomRight,
                child: StreamBuilder<DocumentSnapshot>(
                  stream: doc.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      String email = snapshot.data!['email'];

                      return Text(email);
                    }
                    return const Text('Loading');
                  },
                ),
              ),
            ),
          ),
          const DrawerListTile(
            content: 'My Account',
            icon: Icon(Icons.message),
          ),
          const DrawerListTile(
            content: 'Profile',
            icon: Icon(Icons.account_circle),
          ),
          const DrawerListTile(
            content: 'Settings',
            icon: Icon(Icons.settings),
          ),
          const DrawerListTile(
            content: 'Users',
            icon: Icon(Icons.verified_user_sharp),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
