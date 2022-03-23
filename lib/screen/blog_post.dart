import 'package:flutter/material.dart';
import 'package:flutter_rest_api_blog/controller/blog_post_controller.dart';
import 'package:flutter_rest_api_blog/data/api_service/post_api_service.dart';
import 'package:flutter_rest_api_blog/data/model/blog_post.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BlogPostScreen extends StatefulWidget {
  final int id;


  const BlogPostScreen({Key? key,required this.id}) : super(key: key);
  @override
  State<BlogPostScreen> createState() => _BlogPostScreenState();
}

class _BlogPostScreenState extends State<BlogPostScreen> {
  final BlogPostController _blogPostController = Get.put(BlogPostController());
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _blogPostController.getPost(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        (){
          BlogPostState blogPostState = _blogPostController.blogPostState.value;
          if(blogPostState is BlogPostLoading){
            return ListView(
              children: [
                Shimmer.fromColors(
                  child:  Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      color: Colors.grey,
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      color: Colors.grey,
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      color: Colors.grey,
                      height: 80,
                    )
                  ],
                ), 
                  baseColor: Colors.grey,
                   highlightColor: Colors.white)
              ],
            );
          }
          else if(blogPostState is BlogPostSuccess){
            BlogPost blogPost = blogPostState.post;
            return Column(
              children: [
                Text(blogPost.title ?? ''),
                Divider(),
                Text(blogPost.body ?? ''),
                if(blogPost.photo != null)
                  Image.network('${PostApiService.baseUrl}/${blogPost.photo}')
                
              ],
            );
          }
          else if(blogPostState is BlogPostError){
            return Center(
              child: Text('Something Wrong'),
            );
          }

          return Center();
        }
      ),

      
    );
  }
}