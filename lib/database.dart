import 'package:cloud_firestore/cloud_firestore.dart';

final _posts = FirebaseFirestore.instance.collection('posts');

Future<void> addPost(Map<String, dynamic> data) async =>
  _posts.add(data);

Future<List<QueryDocumentSnapshot>> getPosts() async =>
  (await _posts.get()).docs;
