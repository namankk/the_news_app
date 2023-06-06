import 'package:flutter/material.dart';

class LatestNewsListPage extends StatelessWidget {
  const LatestNewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latest News List Screen"),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("NewsDetailsPage");
              },
              child: const Card(
                child: Text("Heading"),
              ),
            );
          },
          itemCount: 5),
    );
  }
}
