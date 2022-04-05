import 'package:flutter_rest_api_blog/controller/post_list_controller.dart';
import 'package:flutter_rest_api_blog/data/api_service/post_api_service.dart';
import 'package:flutter_rest_api_blog/data/model/upload_response.dart';
import 'package:flutter_rest_api_blog/widget/bottom_nav.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class UploadController extends GetxController{
  final PostApiService _postApiService = Get.find();
  final PostListController _postListController = Get.find();
  RxDouble percentage = 0.0.obs;
  Rx<UploadState> uploadState = UploadState().obs;
  void upload({required String title,required String body,required d.FormData? photo}){
    uploadState.value = UploadLoading();
    _postApiService.uploadPost(title: title, body: body, photo: photo,
    uploadProgress: (send,data){
      percentage.value =  send/data;
    })
     .then((uploadResponse) {
       uploadState.value = UploadSuccess(uploadResponse);
       Future.delayed(Duration(seconds: 1))
        .then((value){
           Get.off(BottomNav());
          
           _postListController.getAllPost();
            uploadState.value =UploadState();
        });
     }).catchError((e){
       uploadState.value = UploadError();
     });
  }

}
class UploadState{}
class UploadLoading extends UploadState{}
class UploadSuccess extends UploadState{
  final UploadRespose uploadRespose;

  UploadSuccess(this.uploadRespose);
}
class UploadError extends UploadState{}