import 'package:flutter_rest_api_blog/data/model/post_list_model.dart';
import 'package:dio/dio.dart';
class PostApiService{
  static const _baseUrl = 'https://rubylearner.herokuapp.com';
  Dio _dio = Dio();
  Future<List<PostListModel>> getAllPost() async{
   var result = await _dio.get('$_baseUrl/posts');
   List postList = result.data as List;
   return postList.map((post){
     return PostListModel.fromJson(post);
   }).toList();
  }
}