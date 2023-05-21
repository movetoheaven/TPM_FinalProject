import 'package:flutter/material.dart';
import 'package:fp_themeal/Screen/detail.dart';
import 'package:fp_themeal/Screen/search.dart';
import 'package:fp_themeal/service/service.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEWS APP'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
          }, icon: const Icon(Icons.search)),
        ],
      ),
      body: FutureBuilder(
        future: Service().getNewsUS(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text(''),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                    child: ListTile(
                      leading: Image.network(snapshot.data[index].urlToImage),
                      title: Text(snapshot.data[index].title),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              newsModel: snapshot.data[index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: snapshot.data.length,
              ),
            );
          }
        },
      ),
    );
  }
}
