class ImageModel {
  int id;
  String  url;
  String title;

  ImageModel(this.id,this.url,this.title);

  ImageModel.fromJson(parseJson){
      id=parseJson['id'];
      title=parseJson['title'];
      url=parseJson['url'];
  }
}