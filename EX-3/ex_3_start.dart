import 'package:flutter/material.dart';

List<String> images = [
  "lib/assets/w4-s2/bird.jpg",
  "lib/assets/w4-s2/bird2.jpg",
  "lib/assets/w4-s2/insect.jpg",
  "lib/assets/w4-s2/girl.jpg",
  "lib/assets/w4-s2/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ? ANSWER: THIS IS TO HIDE THE DEBUG BANNER
    home: ImageGallery(),
  ),
);

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int currentIndex = 0;

  void goToNext() {
    setState(() {
      currentIndex = currentIndex == images.length - 1 ? 0 : currentIndex + 1;
    });
  }

  void goToPrevious() {
    setState(() {
      currentIndex = currentIndex == 0 ? images.length - 1 : currentIndex - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: goToPrevious,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: goToNext,
            ),
          ),
        ],
      ),
      body: Image.asset(
        images[currentIndex],
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
