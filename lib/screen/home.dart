import 'package:flutter/material.dart';
import 'package:flutter_rest_api_blog/controller/post_list_controller.dart';
import 'package:flutter_rest_api_blog/data/api_service/post_api_service.dart';
import 'package:flutter_rest_api_blog/data/model/post_list_model.dart';
import 'package:flutter_rest_api_blog/widget/post_list.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final PostListController _postListController = Get.put(PostListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: Obx(() {
          PostListState state = _postListController.postListState.value;
          if (state is PostListLoading) {
            return ListView(
              children: [
                for(int i=0;i<15;i++)
                  Shimmer.fromColors(
              child: Container(
                height: 30,
                margin: EdgeInsets.all(8.0),
                color: Colors.grey,
              ), 
              baseColor: Colors.grey,
               highlightColor: Colors.white)
              ],
            );
          } else if (state is PostListSuccess) {
            List<PostListModel> postList = state.postLists;
            return PostListWidget(posts: postList);
          } else if (state is PostListError) {
            return Center(
              child: Text('Error'),
            );
          }
          return Center();
        }));
  }
}
