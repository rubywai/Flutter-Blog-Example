import 'dart:io';

import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_blog/controller/upload_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({ Key? key }) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final UploadController _uploadController = Get.put(UploadController());
  final GlobalKey<FormState> _key = GlobalKey();
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String? _title,_body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Post'),
      ),
      body: Obx((){
       UploadState uploadState = _uploadController.uploadState.value;
       if(uploadState is UploadLoading){
         return Center(child:
           Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Text('Uploading ... ${(_uploadController.percentage * 100).toInt()}'),
               Divider(),
              CircularProgressIndicator(value : (_uploadController.percentage * 100))
             ],
           )
         ,);
       }
       else if(uploadState is UploadError){
         return Center(child: Text('Something wrong'),);
       }
       else if(uploadState is UploadSuccess){
         return Center(child: Text(uploadState.uploadRespose.result ?? ''),);
       }
       return Form(
         key: _key,
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               Text('Enter title'),
               TextFormField(
                 onSaved: (title){
                   _title = title;
                 },
                 validator: (title){
                   if(title == null || title.isEmpty){
                     return 'Enter title';
                   }
                 },
               ),
               Divider(),
                Text('Enter body'),
               TextFormField(
                 maxLines: 5,
                 minLines: 3,
                 onSaved: (body){
                   _body = body;
                 },
                 validator: (body){
                   if(body == null || body.isEmpty){
                     return 'Enter Body';
                   }
                 },


               ),
               Divider(),
               IconButton(onPressed: () async{
                  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  if(image != null){
                    setState(() {
                       _image = File(image.path);
                    });
                   
                  }
               }, icon: Icon(Icons.photo)),
               (_image == null) ? SizedBox() : 
               Image.file(_image!,height: 200,),
               ElevatedButton(onPressed: () async{
                 
                 d.MultipartFile? multipartFile ;
                 d.FormData? formData;
                 if(_image != null){
                   multipartFile = await d.MultipartFile.fromFile(_image!.path,filename: 'image.png');
                 }
                 _key.currentState?.save();
                 if(_key.currentState != null && _key.currentState!.validate() ){
                   if(multipartFile != null) {
                      formData = d.FormData.fromMap({
                      'photo' : multipartFile
                    });
                   }
                   _uploadController.upload(title: _title ?? '', body: _body ?? '', photo: formData);
                 }

               }, child: Text('Upload'))

             ],
           ),
         ),
       );
      }),
      
    );
  }
}