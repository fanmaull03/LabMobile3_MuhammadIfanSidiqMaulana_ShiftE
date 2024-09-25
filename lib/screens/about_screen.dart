import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.info_outline),
            SizedBox(width: 8),
            Text('About BookKu'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About BookKu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'BookKu adalah aplikasi yang memudahkan kamu menemukan dan mereview berbagai buku <br> dari berbagai genre—mulai dari fiksi, non-fiksi, hingga fantasi dan roman. <br> Temukan sinopsis singkat, ulasan terpercaya, dan rekomendasi buku yang cocok dengan minatmu. Jangan lewatkan kesempatan untuk memperluas daftar bacaanmu!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Versi: 1.0.0',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
