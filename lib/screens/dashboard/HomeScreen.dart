import 'package:flutter/material.dart';

enum ListingType {
  horizontal,
  vertical,
  grid,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ListingType _listingType = ListingType.vertical;

  List<String> _images = [
    'https://unsplash.com/photos/DT89GVahvRI',
    'https://unsplash.com/photos/NqUdV3xomuY',
    'https://unsplash.com/photos/o5SgqaLEIz0',
    'https://unsplash.com/photos/Nz8TnLwQw68',
    'https://unsplash.com/photos/TRTUOozkHwk',
    'https://unsplash.com/photos/dkDW6aSKihw',
    'https://unsplash.com/photos/PFsSW1nOZOk',
    'https://unsplash.com/photos/dTmynPI5XVA',
    'https://unsplash.com/photos/OelgZ9Hh7Zg',
    'https://unsplash.com/photos/Mf7xCnpfSks'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listing Screen'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _listingType = ListingType.horizontal;
              });
            },
            icon: const Icon(Icons.horizontal_split),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _listingType = ListingType.vertical;
              });
            },
            icon: const Icon(Icons.view_list),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _listingType = ListingType.grid;
              });
            },
            icon: const Icon(Icons.grid_view),
          ),
        ],
      ),
      body: _buildListing(),
    );
  }

  Widget _buildListing() {
    switch (_listingType) {
      case ListingType.horizontal:
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              width: 160,
              color: Colors.grey[300],
            child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
              child: Card(
                child: Image.network(
                  _images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            );
          },
        );
      case ListingType.vertical:
        return ListView.builder(
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
              child: Container(
                height: 200,
                child: Card(
                  child: Image.network(
                    _images[index],
                    fit: BoxFit.cover,
                  ),
                  ),
                ),
              ),
            );
          },
        );
      case ListingType.grid:
        return GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            _images.length,
                (index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  child: Card(
                    child: Image.network(
                      _images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  ),
              );
            },
          ),
        );
    }
  }
}
