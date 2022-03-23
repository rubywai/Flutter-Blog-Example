import 'package:flutter/material.dart';
import 'package:flutter_rest_api_blog/data/model/post_list_model.dart';
import 'package:flutter_rest_api_blog/screen/blog_post.dart';
import 'package:get/get.dart';

class PostListWidget extends StatelessWidget {
  PostListWidget({Key? key, required this.posts}) : super(key: key);
  final List<PostListModel> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Get.to(BlogPostScreen(id: posts[index].id ?? 1));
            },
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(posts[index].title ?? '')),
            )),
          );
        });
  }
}
