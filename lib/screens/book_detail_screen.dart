import 'package:flutter/material.dart';
import '../book/book_model.dart'; // Import model Book

class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Author: ${book.author}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Genre: ${book.genre}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Synopsis:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            // Menampilkan sinopsis sebagai beberapa paragraf
            for (String paragraph in book.synopsis)
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  paragraph,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
