class TweetModel{
  int id,likes;
  String description,image,liked;

  TweetModel(this.id, this.description, this.image,this.likes,this.liked);

  TweetModel.fromJson(Map<String,dynamic>map){
    this.id = map["id"];
    this.likes = map["likes"];
    this.liked = map["liked"];
    this.description = map["description"];
    this.image = map["image"]["url"];
  }
}