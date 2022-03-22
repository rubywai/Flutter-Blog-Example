import 'package:flutter/material.dart';
import 'package:flutter_rest_api_blog/controller/post_list_controller.dart';
import 'package:flutter_rest_api_blog/data/api_service/post_api_service.dart';
import 'package:flutter_rest_api_blog/data/model/post_list_model.dart';
import 'package:flutter_rest_api_blog/widget/post_list.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final PostListController _postListController = Get.put(PostListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Obx(
        (){
          PostListState state = _postListController.postListState.value;
          if(state is PostListLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is PostListSuccess){
            List<PostListModel> postList = state.postLists;
            return PostListWidget(posts: postList);
          }
          else if(state is PostListError){
            return Center(child: Text('Error'),);
          }
          return Center();

        }
      )
    );
  }
}
