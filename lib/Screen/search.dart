import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fp_themeal/Screen/detail.dart';

import '../service/service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  String query = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 15.3),
            border: InputBorder.none,
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            hintText: "Search News Here",
            suffixIcon: IconButton(
              onPressed: searchController.clear,
              icon: const Icon(
                Icons.clear,
                color: Colors.black,
              ),
            ),
          ),
          onEditingComplete: () {
            setState(() {
              query = searchController.text;
            });
          },
        ),
      ),
      body: query != ""
          ? FutureBuilder(
              future: Service().getNewsSearch(query),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  );
                } else {
                  return Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(snapshot.data[index].title),
                            leading:
                                Image.network(snapshot.data[index].urlToImage),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    newsModel: snapshot.data[index],
                                  ),
                                ),
                              );
                            });
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox.shrink(),
                      itemCount: snapshot.data!.length,
                    ),
                  );
                }
              },
            )
          : const Center(
              child: Text('Empty'),
            ),
    );
  }
}
