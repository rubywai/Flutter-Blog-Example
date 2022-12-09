import 'package:flutter_rest_api_blog/data/model/blog_post.dart';
import 'package:flutter_rest_api_blog/data/model/post_list_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_rest_api_blog/data/model/upload_response.dart';
class PostApiService{
  static const baseUrl = 'http://44.207.161.4:5000';
  Dio _dio = Dio();
  Future<List<PostListModel>> getAllPost() async{
   var result = await _dio.get('$baseUrl/posts');
   List postList = result.data as List;
   return postList.map((post){
     return PostListModel.fromJson(post);
   }).toList();
  }
  Future<List<BlogPost>> getPost(int id) async{
    var result = await _dio.get('$baseUrl/post?id=$id');
    List postList = result.data as List;
    return postList.map((post){
      return BlogPost.fromJson(post);
    }).toList();

  }
  Future<UploadRespose> uploadPost({required String title,required String body,required FormData? photo,required Function(int,int) uploadProgress}) async{
    var result = await _dio.post('$baseUrl/post?title=$title&body=$body',data: photo,onSendProgress: uploadProgress);
    UploadRespose uploadRespose = UploadRespose.fromJson(result.data);
    return uploadRespose;
  }
}
