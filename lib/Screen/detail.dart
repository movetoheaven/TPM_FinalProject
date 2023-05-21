import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fp_themeal/model/model.dart';


class DetailScreen extends StatelessWidget {
  NewsModel newsModel;
  DetailScreen({
    super.key,
    required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsModel.title),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: NetworkImage(newsModel.urlToImage!)),
            SizedBox(height: 15),
            Text(newsModel.author!),
            Divider(),
            SizedBox(height: 15),
            Text(newsModel.description!),
            Divider(),
            SizedBox(height: 15,),
            Text('Link: ' + newsModel.url!),
            
          ],
        ),
         
        ),
      );
  }
}
