
import 'package:flutter_rest_api_blog/data/api_service/post_api_service.dart';
import 'package:flutter_rest_api_blog/data/model/post_list_model.dart';
import 'package:get/get.dart';

class PostListController extends GetxController{
  PostApiService _postApiService = Get.find();
  Rx<PostListState> postListState = PostListState().obs;
  
  @override
  void onInit() {
    super.onInit();
    getAllPost();
  }

  void getAllPost(){
    postListState.value = PostListLoading();
    _postApiService.getAllPost()
     .then((postLists){
       postListState.value = PostListSuccess(postLists);
     })
     .catchError((e){
       print(e.toString());
       postListState.value = PostListError();
     });
  }

}
class PostListState{}
class PostListLoading extends PostListState{}
class PostListSuccess extends PostListState{
  final List<PostListModel> postLists;

  PostListSuccess(this.postLists);
}
class PostListError extends PostListState{}
 
 
