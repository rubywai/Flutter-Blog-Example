import 'package:flutter/material.dart';
import 'package:flutter_rest_api_blog/data/model/post_list_model.dart';

class PostListWidget extends StatelessWidget {
   PostListWidget({ Key? key , required this.posts}) : super(key: key);
   final List<PostListModel> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(posts[index].title ?? '')),
                      ));
                });
  }
}