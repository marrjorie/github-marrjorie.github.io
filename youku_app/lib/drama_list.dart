// lib/kdrama_list.dart

import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Explore',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          // Add a search icon to the app bar
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              // Handle search action
              // You can open a search page or show/hide the search bar as needed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Wrap the content in a SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTextButton('Drama', 0),
                  buildTextButton('Anime', 1),
                  buildTextButton('Movie', 2),
                  buildTextButton('Variety', 3),
                  buildTextButton('Kids', 4),
                  buildTextButton('Documentary', 5),
                  buildTextButton('Culture', 6),
                ],
              ),

              SizedBox(height: 10),
              // Example: List of Top Trending Dramas with Clickable Image
              buildDramaList([
                DramaTile(
                  'HIDDEN LOVE',
                  'https://miro.medium.com/v2/resize:fit:1024/1*XSPebIkn0Z_QGrHsUldB-Q.jpeg',
                ),
                DramaTile(
                  'TILL THE END OF THE MOON',
                  'https://1.vikiplatform.com/c/39703c/29504ba01e.jpg?x=b&s=480x270&e=t&q=g',
                ),
                DramaTile(
                  'MOVING',
                  'https://photos.hancinema.net/photos/fullsizephoto1699556.jpg',
                ),
                DramaTile(
                  'BEING A HERO',
                  'https://media.suara.com/pictures/653x366/2022/08/14/67879-poster-being-a-hero-weibo-youku.jpg',
                ),
                DramaTile(
                  'BRIGHT EYES IN THE DARK',
                  'https://asset-2.tstatic.net/pekanbaru/foto/bank/images/drama-china-Bright-Eyes-in-The-Dark-sub-indo.jpg',
                ),
                DramaTile(
                  'LOVE UNEXPECTED',
                  'http://pic5.iqiyipic.com/image/20220228/e5/9c/a_100496942_m_601_en_m5_1013_569.webp',
                ),
              ]),
              SizedBox(height: 10),
              // Additional Drama Tiles
              buildDramaList([
                DramaTile(
                  'FIREWORKS OF MY HEART',
                  'https://prod-images.viu.com/3420316107/b531b70e287bdbdf9ebababf2985cf973cbe9f43',
                ),
                DramaTile(
                  'LOVE IN FLAMES OF WAR',
                  'https://cms.dmpcdn.com/movie/2022/10/12/1e65f280-4a20-11ed-884c-1984d86180f7_webp_original.jpg',
                ),
                DramaTile(
                  'A GOOD DAY TO BE A DOG',
                  'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/18/2023/10/25/Screenshot-2023-10-25-090345-3456608322.png',
                ),
                DramaTile(
                  'BATTLE OF JUSTICE',
                  'https://i.ytimg.com/vi/4fvzIFJFtTc/maxresdefault.jpg',
                ),
                DramaTile(
                  'BACK TO THE PALACE',
                  'https://i.ytimg.com/vi/hZsqK70sB3c/hqdefault.jpg',
                ),
                DramaTile(
                  'THE BRAVE RABBIT',
                  'https://i.ytimg.com/vi/VD6O9rkdN_k/maxresdefault.jpg',
                ),
                // Add more DramaTiles as needed
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextButton(String text, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: _selectedIndex == index
              ? Color.fromARGB(255, 33, 149, 245)
              : Colors.black,
        ),
      ),
    );
  }

  Widget buildDramaList(List<DramaTile> dramaList) {
    return Container(
      height: 250, // Adjust the height as needed
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: dramaList.map((drama) {
            return buildClickableDramaTile(drama);
          }).toList(),
        ),
      ),
    );
  }

  Widget buildClickableDramaTile(DramaTile drama) {
    return GestureDetector(
      onTap: () {
        // Handle onTap for drama link navigation
        // You can navigate to the drama link here
        // For example, you can use a package like url_launcher to open the drama link in a web browser.
      },
      child: Container(
        width: 200, // Adjust the width as needed
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            // Clickable Image
            Image.network(
              drama.imageUrl,
              height: 100, // Adjust the height as needed
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            // Drama Name
            Text(
              drama.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            // Description
          ],
        ),
      ),
    );
  }
}

class DramaTile {
  final String title;

  final String imageUrl;

  DramaTile(this.title, this.imageUrl);
}
