import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_news_app/providers/latest_news_list_provider.dart';

class LatestNewsListPage extends StatelessWidget {
  const LatestNewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<LatestNewsListProvider>(context, listen: false)
        .getLatestNewsList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Latest News List Screen"),
      ),
      body: Consumer<LatestNewsListProvider>(
        builder: (context, provider, widget) {
          return RefreshIndicator(
            onRefresh: ()=>provider.getLatestNewsList(),
            child: provider.showLoading
                ? const Center(child: CircularProgressIndicator())
                : provider.listOfArticle != null
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("NewsDetailsPage");
                            },
                            child: Card(
                              child: Text(provider.listOfArticle![index].title),
                            ),
                          );
                        },
                        itemCount: provider.listOfArticle!.length)
                    : const SingleChildScrollView(child: Center(child: Text("Error in The Widget"))),
          );
        },
      ),
    );
  }
}
