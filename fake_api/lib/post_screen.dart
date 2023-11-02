import 'package:fake_api/api_services.dart';
import 'package:fake_api/post_model.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Future<List<PostModel>?> posts;
  @override
  void initState() {
    super.initState();
    posts = ApiServices().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: posts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListTile(
                leading: Text(snapshot.data![0].id.toString()),
                title: Text(snapshot.data![0].title.toString()),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
