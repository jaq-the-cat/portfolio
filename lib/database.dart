import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addPost(Map<String, dynamic> data) async =>
  FirebaseFirestore.instance.collection('posts').add(data);

Future<List<QueryDocumentSnapshot>> getPosts() async =>
  (await FirebaseFirestore.instance.collection('posts').get()).docs;
