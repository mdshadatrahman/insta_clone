import 'package:flutter/material.dart';
import 'package:instagram/screens/add_post_screen.dart';
import 'package:instagram/screens/feed_screen.dart';
import 'package:instagram/screens/search_screen.dart';

const webScreeenSize = 600;
const homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text('Notification'),
  Text('Profile'),
];
