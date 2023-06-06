import 'package:flutter/material.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News Details Page")),
      body: Column(
        children: [
          Image.network("https://nypost.com/wp-content/uploads/sites/2/2023/06/newspress-collage-27360230-1686033139004.jpg?quality=75&strip=all&1686018793&w=1024"),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Heading of the News"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Hundreds of Ukrainians living in villages along the Dnipro River were given less than five hours to evacuate their homes Tuesday after officials say Russian for..."),
          )
        ],
      ),
      

    );
  }
}
