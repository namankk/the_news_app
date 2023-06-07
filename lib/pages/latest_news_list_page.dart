import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_news_app/providers/latest_news_list_provider.dart';
import 'package:the_news_app/widgets/common_widgets.dart';
import 'package:the_news_app/widgets/news_tile_widget.dart';

class LatestNewsListPage extends StatelessWidget {
  const LatestNewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<LatestNewsListProvider>(context, listen: false)
        .getLatestNewsList();

    return Scaffold(
      appBar: mainAppBar(mainAxisAlignment: MainAxisAlignment.center),
      body: Consumer<LatestNewsListProvider>(
        builder: (context, provider, widget) {
          return RefreshIndicator(
            onRefresh: () => provider.getLatestNewsList(),
            child: provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : provider.listOfArticle != null
                    ? Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: provider.listOfArticle!.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      "NewsDetailsPage",
                                      arguments:
                                          provider.listOfArticle![index]);
                                },
                                child: NewsTile(
                                  imgUrl:
                                      provider.listOfArticle![index].imageUrl,
                                  title: provider.listOfArticle![index].title,
                                  desc: provider
                                      .listOfArticle![index].description,
                                  content:
                                      provider.listOfArticle![index].snippet,
                                ),
                              );
                            }),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Something went wrong",
                              maxLines: 2,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  provider.getLatestNewsList();
                                },
                                child: const Text("Retry"))
                          ],
                        ),
                      ),
          );
        },
      ),
    );
  }
}
