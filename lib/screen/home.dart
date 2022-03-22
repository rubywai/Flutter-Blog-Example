import 'package:flutter/material.dart';
import 'package:flutter_rest_api_blog/data/api_service/post_api_service.dart';
import 'package:flutter_rest_api_blog/data/model/post_list_model.dart';
import 'package:flutter_rest_api_blog/widget/post_list.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  PostApiService _postApiService = PostApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: FutureBuilder<List<PostListModel>>(
        future: _postApiService.getAllPost(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            List<PostListModel> posts = snapshot.data ?? [];
            return PostListWidget(posts: posts);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
