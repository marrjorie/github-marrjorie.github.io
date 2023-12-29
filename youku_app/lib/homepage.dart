import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                    40, 120, 144, 215), // Gray background for the logo
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Youku_logo_%282%29.svg/1200px-Youku_logo_%282%29.svg.png',
                height: 50,
              ),
            ),
            SizedBox(width: 8),
            // Search Bar
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                      40, 120, 144, 215), // Sky blue color for the search bar
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.white), // Search icon
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
                  buildTextButton('Home', 0),
                  buildTextButton('Shorts', 1),
                  buildTextButton('Vote Channel', 2),
                  buildTextButton('Drama', 3),
                  buildTextButton('Anime', 4),
                ],
              ),
              SizedBox(height: 50),
              // Top Trending Dramas
              Text(
                'Top Trending Dramas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Example: List of Top Trending Dramas with Clickable Image
              buildDramaList([
                DramaTile(
                  'HIDDEN LOVE',
                  'Chinese Drama',
                  'https://miro.medium.com/v2/resize:fit:1024/1*XSPebIkn0Z_QGrHsUldB-Q.jpeg',
                ),
                DramaTile(
                  'DEATHS GAME',
                  'K-Drama',
                  'https://d263ao8qih4miy.cloudfront.net/wp-content/uploads/2023/12/DeathsGame_reviewb.jpg',
                ),
                DramaTile(
                  'MONARCH: LEGARCY OF MONSTERS',
                  'Western TV',
                  'https://www.escapistmagazine.com/wp-content/uploads/2023/09/Monarch-Legacy-of-Monsters-1-1-scaled-1.jpg?fit=2560%2C1440',
                ),
                DramaTile(
                  'PROMISE IN THE SUMMER',
                  'Chinese Drama',
                  'https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/S/pv-target-images/ead9628fabf6276340e6be6279634db789c417a726156242981261388fb1082d._AC_SX720_FMjpg_.jpg',
                ),
                DramaTile(
                  'SPY x FAMILY S2',
                  'Anime',
                  'https://gameranx.com/wp-content/uploads/2022/12/image-128.png',
                ),
                DramaTile(
                  'THANKSGIVING',
                  'Horror',
                  'https://www.gamereactor.eu/media/01/_4100173b.png',
                ),
              ]),
              SizedBox(height: 10),
              // Additional Drama Tiles
              buildDramaList([
                DramaTile(
                  'MY MAN IS CUPID',
                  'K-Drama',
                  'https://www.bigflix.com/wp-content/uploads/2023/12/E-10.jpg',
                ),
                DramaTile(
                  'NIGHT HAS COME',
                  'K-DRAMA',
                  'https://6.soompi.io/wp-content/uploads/image/20231120084708_night-has-come-2-1-1.jpg?s=900x600&e=t',
                ),
                DramaTile(
                  'A GOOD DAY TO BE A DOG',
                  'K-Drama',
                  'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/18/2023/10/25/Screenshot-2023-10-25-090345-3456608322.png',
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
            Text(
              drama.description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class DramaTile {
  final String title;
  final String description;
  final String imageUrl;

  DramaTile(this.title, this.description, this.imageUrl);
}
