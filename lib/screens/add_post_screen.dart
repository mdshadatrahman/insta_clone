import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(
    //     icon: const Icon(Icons.upload),
    //     onPressed: () {},
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Post to'),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Post',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1643630593793-e7f068b2fb9e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
