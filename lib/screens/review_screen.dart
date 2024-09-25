// lib/screens/review_screen.dart
import 'package:flutter/material.dart';
import '../book/book_model.dart';
import 'book_detail_screen.dart'; // Import untuk halaman detail buku

class ReviewScreen extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'Tuhan Maha Asyik',
      author: 'Sujiwo Tedjo, M.N. Kamba',
      genre: 'God, Religion, Non fiction',
      synopsis: [
        'Melalui kisah-kisah yang dikemas dalam dialog polos ala dunia bocah, Sujiwo Tejo dan Buya MN. Kamba coba mengajak kita "bermain-main" untuk memperkenalkan ke-Maha Asyik-an Tuhan.',
        'Tuhan sangat asyik ketika Dia tidak kita kurung paksa dalam penamaan-penamaan dan pemaknaan-pemaknaan. Dia tak terdefinisikan. Dia tak terkmaknakan. Dia ada sebelum definisi dan makna ada. Tuhan itu anti mainstream. Tuhan itu Maha Asyik ketika kita mentadabburi-Nya, bukan melogikakan-Nya.',
        'Dengan mencampakkan kesombongan dan taklid pada kerendahan hati, buku ini mengingatkan pada kita: bahwa ke manapun kau memandang, di situlah wajah Tuhan.',
      ],
    ),
    Book(
      title: 'Law of Attraction',
      author: 'Michael J. Losier',
      genre: 'Psychology, Self help, Spirituality, Philosopy',
      synopsis: [
        '"The Science of Attracting More of What You Wantand Less of What You Don`t"',
        'You may not be aware of it, but a very powerful force is at work in your life. Its called the Law of Attraction and right now it is attracting people, jobs, situations, and relationships in your life -- not all of them good! Now, with Michael Losier`s help, you can learn how to use the Law of Attraction deliberately and turn it into a positive force that will change your life.',
        'If your life feels as if it has turned south and taken on the characteristics of a bad soap opera, it`s time to pick up Michael Losier`s iLaw of Attraction/i. This simple, easy-to-use book is full of tips, tools,exercises and scripts to help you use the Law of Attraction so you can integrate this powerful force in your life every day.',
      ],
    ),
    Book(
      title: 'Bumi Manusia',
      author: 'Pramoedya Ananta Toer',
      genre: 'Fiction, Novels, Classics, Literatur',
      synopsis: [
        'Roman Tetralogi Buru mengambil latar belakang dan cikal bakal nation Indonesia di awal abad ke-20. Dengan membacanya waktu kita dibalikkan sedemikian rupa dan hidup di era membibitnya pergerakan nasional mula-mula, juga pertautan rasa, kegamangan jiwa, percintaan, dan pertarungan kekuatan anonim para srikandi yang mengawal penyemaian bangunan nasional yang kemudian kelak melahirkan Indonesia modern.'
      ],
    ),
    Book(
      title: 'Harry Potter and the Sorcerer\'s Stone',
      author: 'J.K. Rowling',
      genre: 'Fantasy',
      synopsis: [
        'The first book in the Harry Potter series, where a young boy discovers he is a wizard and attends Hogwarts School of Witchcraft and Wizardry.',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Buku'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(book: book),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
