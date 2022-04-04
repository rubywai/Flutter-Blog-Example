class PostListModel{
 int? id;
 String? title;
 PostListModel({int? id,String? title}){
   this.id = id;
   this.title =title;
 }
 factory PostListModel.fromJson(Map<String,dynamic> json){
   int? _id = json['id'];
   String? _title = json['title'];
   return PostListModel(id: _id,title: _title);
 }
}