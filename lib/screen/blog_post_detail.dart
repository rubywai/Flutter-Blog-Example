import 'package:flutter/material.dart';
import 'package:flutter_rest_api_blog/controller/blog_post_controller.dart';
import 'package:flutter_rest_api_blog/data/api_service/post_api_service.dart';
import 'package:flutter_rest_api_blog/data/model/blog_post.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

class BlogPostScreen extends StatefulWidget {
  final int id;
  final String title;
  BlogPostScreen({Key? key, required this.id, required this.title})
      : super(key: key);

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Obx(() {
        BlogPostState blogPostState = _blogPostController.blogPostState.value;
        if(blogPostState is BlogPostSuccess){
          BlogPost post = blogPostState.post;
          return SingleChildScrollView(
            child: Column(
              children : [
                Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(post.title ?? ''),
                )),
                const Divider(),
                Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(post.body ?? ''),
                )),
                const Divider(),
                (post.photo== null) ?
                const SizedBox() : Image.network('${PostApiService.baseUrl}/${post.photo}',height: 300,)
                  ]
            ),
          );
        }
        if(blogPostState is BlogPostError){
          return const Center(
            child: Text('Error'),
          );
        }
        if(blogPostState is BlogPostLoading) {
          return Shimmer.fromColors(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            baseColor: Colors.grey,
            highlightColor: Colors.white);
        }
        return const SizedBox();
      }),
    );
  }
}
