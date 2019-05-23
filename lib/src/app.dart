import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_lists.dart';
// import 'package:webview_flutter/webview_flutter.dart';


class App extends StatefulWidget{
  createState(){
    return AppState();
  }
}

class AppState extends State<App>{

  int counter=0;
  List<ImageModel> images=[];

  void fetchImage() async{
    counter++;
    final response=await get('https://jsonplaceholder.typicode.com/photos/$counter');
    final imageModel=ImageModel.fromJson(json.decode(response.body));
    // images.add(imageModel);
   
    setState(() {
       images.add(imageModel);
    });
    print(imageModel);
  }

  Widget build(BuildContext context) {
    return   MaterialApp(
                home: Scaffold(
                  body: ImageList(images),
                  floatingActionButton:FloatingActionButton(
                    onPressed:fetchImage,
                    tooltip: 'Hihi',
                    child: Icon(Icons.add_a_photo)
                  ),
                  appBar: AppBar(
                    title: Text("Voici le moment du refactoring"),centerTitle: true)
                  )     
              );
    }

}

 