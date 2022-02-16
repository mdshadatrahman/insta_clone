import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> uploadPost(String description, String uid, Uint8List file,
      String username, String profileImage) async {
    String res = 'some error occured';
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        postId: postId,
        username: username,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profileImage: profileImage,
        like: [],
      );
      _firestore.collection('posts').doc(postId).set(
            post.toJson(),
          );
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> likePost(String postId, String uid, List like) async {
    try {
      if (like.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          'like': FieldValue.arrayRemove([uid]),
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'like': FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> postComment(String postId, String text, String uid, String name,
      String profilePic) async {
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'username': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
      } else {
        print('empty comment');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
