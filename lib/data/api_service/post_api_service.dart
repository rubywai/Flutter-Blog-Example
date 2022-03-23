import 'package:flutter_rest_api_blog/data/model/blog_post.dart';
import 'package:flutter_rest_api_blog/data/model/post_list_model.dart';
import 'package:dio/dio.dart';
class PostApiService{
  static const baseUrl = 'https://rubylearner.herokuapp.com';
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
}