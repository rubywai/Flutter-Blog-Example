import 'package:flutter_rest_api_blog/data/api_service/post_api_service.dart';
import 'package:flutter_rest_api_blog/data/model/upload_response.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class UploadController extends GetxController{
  PostApiService _postApiService = Get.find();
  Rx<UploadState> uploadState = UploadState().obs;
  void upload({required String title,required String body,required d.FormData? photo}){
    uploadState.value = UploadLoading();
    _postApiService.uploadPost(title: title, body: body, photo: photo)
     .then((uploadResponse) {
       uploadState.value = UploadSuccess(uploadResponse);
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