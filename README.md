<b> PENJELASAN TIAP BAGIAN PENTING KODE </b>

1. kode file login_screen.dart :
   - class LoginScreen extends StatefulWidget { ... }
     <br> LoginScreen adalah widget yang state-nya bisa berubah, oleh karena itu menggunakan StatefulWidget.<br>

   - class _LoginScreenState extends State<LoginScreen> { ... }
      <br> LoginScreen menggunakan _LoginScreenState untuk mengelola state-nya, termasuk kontrol UI dan aksi login. <br>

   - final TextEditingController _usernameController = TextEditingController(); <br>
     final TextEditingController _passwordController = TextEditingController(); <br>
     TextEditingController digunakan untuk mengambil input teks dari field username dan password. <br>

   - Future<void> _login() async { ... } <br>
     Fungsi asinkron yang memeriksa input username dan password. Jika benar (username == 'admin' dan password == 'admin'),    username disimpan ke SharedPreferences, lalu dialog login sukses ditampilkan. Jika salah, menampilkan dialog error. <br>
     
   - SharedPreferences prefs = await SharedPreferences.getInstance(); <br>
     await prefs.setString('username', username); <br>
     Menyimpan username ke penyimpanan lokal menggunakan SharedPreferences. <br>

   - showDialog(
  context: context,
  builder: (BuildContext context) { ... }
); <br>
Menampilkan dialog notifikasi login berhasil atau gagal. <br>

   - Widget build(BuildContext context) { ... } <br>
    build() membangun UI login screen, termasuk AppBar, input field untuk username dan password, serta tombol login. <br>

   - TextField(
  controller: _usernameController, 
  ...
); <br>
Input field untuk username dan password. Password field memiliki fitur visibilitas menggunakan IconButton. <br>

   - ElevatedButton(
  onPressed: _login, 
  child: Text('Login'),
);
 <br> Tombol Login yang men-trigger fungsi _login saat ditekan. <br>

   - _isPasswordVisible = !_isPasswordVisible;
<br> Logika untuk mengatur apakah password terlihat atau disembunyikan saat pengguna menekan ikon visibilitas pada field password. <br> <br>

<img src="https://github.com/user-attachments/assets/9aac0af3-ec83-4d77-b659-425b98bdf12d"  alt="Tampilan Login" width="250">
<img src="https://github.com/user-attachments/assets/1337153b-7732-4baf-bfe6-7f738a07079e" alt="login benar" width="250">
<img src="https://github.com/user-attachments/assets/0d5a2140-3d9a-47a3-9f93-226817d41124" alt="login Salah" width="250">
<br>
<br>

2. Kode file home_screen :

  - class HomeScreen extends StatefulWidget { ... } <br>
    HomeScreen adalah widget yang menggunakan StatefulWidget karena ada state yang akan diubah, seperti memuat username. <br>
    
  - class _HomeScreenState extends State<HomeScreen> { ... } <br>
    HomeScreen menggunakan _HomeScreenState untuk mengelola data dan logika tampilan. <br>

  - String _username = ''; <br>
    Variabel _username digunakan untuk menyimpan nama pengguna yang akan ditampilkan setelah di-load dari SharedPreferences. <br>
  - @override
void initState() {
  super.initState();
  _loadUsername();
} <br>
    initState() dipanggil saat widget pertama kali dimuat. Di sini, fungsi _loadUsername() digunakan untuk memuat data username dari SharedPreferences (meskipun implementasinya tidak lengkap di sini). <br>

  - Future<void> _loadUsername() async {...} <br>
    Fungsi asinkron yang seharusnya digunakan untuk mengambil username dari SharedPreferences, namun implementasinya tidak ditulis dalam kode ini. <br>

  - return Scaffold( ... ); <br>
    Scaffold menyediakan struktur dasar dari layar, seperti AppBar, drawer, dan body. <br>

  - appBar: AppBar(
  title: Row(
    children: [Icon(Icons.home), SizedBox(width: 8), Text('Home - BookKu')],
  ),
), <br>
    AppBar berisi judul layar dan ikon home. Judul menggunakan kombinasi ikon dan teks yang diberi jarak menggunakan SizedBox. <br>

  - drawer: SideMenu(), <br>
    Menambahkan drawer (menu samping) menggunakan widget SideMenu, yang mungkin diimpor dari file terpisah side_menu.dart. <br>
  - body: Center(
  child: Column(...)) <br>
    Body adalah tampilan utama <br>

  - ElevatedButton(...) <br>
    Tombol ElevatedButton yang menavigasi ke halaman "Review Buku" menggunakan routing ke /review saat ditekan. <br>
    <br>
<img src="https://github.com/user-attachments/assets/11992425-0d13-4f93-a8b4-a71f4f4c83e9" alt="halaman_home" width="250">
<br>
<br>

3. kode file side_menu.dart :

  - class SideMenu extends StatelessWidget { ... } <br>
    SideMenu adalah widget yang bersifat statis (StatelessWidget), karena tidak ada perubahan state yang diperlukan. Ini digunakan untuk membangun drawer (menu samping) dalam aplikasi. <br>

  - return Drawer(child: ListView(...),); <br>
    Menggunakan widget Drawer untuk membuat menu samping dengan daftar item, 
ListView digunakan untuk membuat daftar item menu di dalam Drawer. <br>

  - DrawerHeader(...), child(...),); <br>
    Bagian ini menampilkan header menu dengan teks "Menu - BookKu" dan latar belakang yang warnanya diambil dari primaryColor aplikasi. <br>

  - Listile(...) <br>
    Mengarahkan pengguna ke beberapa layar atau halaman yang diinginkan seperti Home, About, Setting, dan Logout. <br>

  - Divider(),
    Menyisipkan garis pemisah (Divider) antara item menu reguler dengan tombol Logout.

<img src="https://github.com/user-attachments/assets/31d7f099-c653-4b27-9882-3fd3a796d232" alt="drawer menu" width="250"> 
<br>
<br>

4. kode file setting_screen.dart :

   - class SettingsScreen extends StatelessWidget { ... } <br>
     SettingsScreen adalah widget tanpa state (StatelessWidget) yang menampilkan pengaturan, termasuk pengaturan tema. <br>

   - final themeProvider = context.watch<ThemeProvider>(); <br>
     Mengambil instance ThemeProvider dari context menggunakan watch, yang memungkinkan widget merespons perubahan dalam provider (seperti perubahan tema). <br>

   - Text(
  'Appearance',
  style: Theme.of(context).textTheme.headlineMedium,
), <br>
    Menampilkan judul bagian "Appearance" menggunakan gaya teks dari tema aktif (mungkin disesuaikan untuk dark mode atau light mode). <br>

   - ListTile(
  title: Text('Dark Mode'),
  trailing: Switch(
    value: themeProvider.isDarkMode,
    onChanged: (value) {
      themeProvider.toggleTheme();
    },
  ),
), <br>
      Menampilkan pengaturan untuk dark mode dengan switch, 
Nilai Switch diambil dari themeProvider.isDarkMode, yang menandakan apakah mode gelap sedang aktif, 
Ketika switch diubah, fungsi toggleTheme() dipanggil untuk mengubah tema. <br>

   - Text(
  'Additional Info',
  style: Theme.of(context).textTheme.headlineMedium,
),
ListTile(
  title: Text('Version'),
  subtitle: Text('1.0.0'),
), <br>
    Menampilkan informasi tambahan seperti versi aplikasi ("Version 1.0.0"). <br>
    <br>
    <img src="https://github.com/user-attachments/assets/cb66e11a-08a1-4655-aacc-87488d3b96f8" width="250">
    <img src="https://github.com/user-attachments/assets/35a1b680-3367-4370-ab39-38090f699dfd" width="250">
    <img src="https://github.com/user-attachments/assets/0b57af0a-2969-487b-a23c-210603ec2f3d" width="250">
     <br>
     <br>

5. kode file review_screen.dart, book_model.dart, dan book_detail_screen :

   - class Book { <br>
     Membuat class Book yang merepresentasikan objek buku, yang dapat digunakan untuk menyimpan informasi terkait buku seperti judul, penulis, genre, dan sinopsis. <br>

   - final String title;
final String author;
final String genre;
final List<String> synopsis; <br>
      title: Menyimpan judul buku. <br>
author: Menyimpan nama penulis buku. <br>
genre: Menyimpan genre atau kategori buku (misalnya: fiksi, non-fiksi, dll). <br>
synopsis: Menyimpan daftar sinopsis yang berupa list dari string. Ini memungkinkan sinopsis buku terdiri dari beberapa paragraf atau poin yang disimpan sebagai item dalam list. <br>

    - Book({
  required this.title,
  required this.author,
  required this.genre,
  required this.synopsis,
}); <br>
      Constructor ini memastikan bahwa setiap kali objek Book dibuat, properti title, author, genre, dan synopsis harus diberikan nilainya (required). <br>


   - final List<Book> books = [ ... ]; <br>
     Sebuah daftar (List<Book>) berisi beberapa objek Book dengan atribut seperti title, author, genre, dan synopsis. 
Setiap objek buku diisi dengan informasi terkait buku-buku seperti Tuhan Maha Asyik, Law of Attraction, Bumi Manusia, dan Harry Potter and the Sorcerer’s Stone. <br>

    - class ReviewScreen extends StatelessWidget { ... } <br>
      ReviewScreen adalah widget tanpa state (StatelessWidget) yang menampilkan daftar buku untuk di-review. <br>

    - body: ListView.builder(
  itemCount: books.length,
  itemBuilder: (context, index) { ... },
), <br>
      Menggunakan ListView.builder untuk membuat daftar dinamis yang jumlah itemnya sesuai dengan panjang daftar books (dalam kasus ini, 4 buku). 
itemBuilder dipanggil untuk setiap item di dalam daftar, yang mengambil indeks (index) dari daftar buku. <br>

    - return ListTile(
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
); <br>
      ListTile digunakan untuk menampilkan judul dan penulis dari setiap buku. 
Saat pengguna menekan salah satu item di dalam daftar (onTap), aplikasi akan melakukan navigasi ke layar detail buku (BookDetailScreen) menggunakan Navigator.push dan mengirimkan objek book yang dipilih. <br>
<br>

    - final Book book;

BookDetailScreen({required this.book}); <br>
      final Book book: Properti book menyimpan data buku yang akan ditampilkan pada layar detail. 
Constructor BookDetailScreen menerima objek Book yang diberikan saat halaman ini dipanggil, dan menjadikannya sebagai required parameter. <br>

      - return Scaffold(
  appBar: AppBar(
    title: Text(book.title),
  ), <br>
      Scaffold: Merupakan struktur dasar layar. 
AppBar: Menampilkan judul buku di bar bagian atas halaman detail (AppBar) menggunakan judul yang diambil dari properti book.title. <br>

      - body: padding(...); <br>
      Tampilan utama dari Detail Buku. <br>

      - for (String paragraph in book.synopsis)
  Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Text(
      paragraph,
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.justify,
    ),
  ), <br>
      Menggunakan loop for untuk menampilkan setiap paragraf sinopsis yang terdapat dalam list book.synopsis. 
Setiap paragraf diberi padding bawah untuk memberi jarak antar paragraf dan ditampilkan dengan ukuran font lebih kecil (fontSize: 16) dan rata kiri-kanan (textAlign: TextAlign.justify). <br>
<br>

<img src="https://github.com/user-attachments/assets/048e7ba6-f7c2-43fd-b784-8c541269a1f8" width="250">
<img src="https://github.com/user-attachments/assets/68576601-2a3c-4759-a781-55793a33fdca" width="250">
<img src="https://github.com/user-attachments/assets/41b6a223-8d11-4dce-8950-6a77b797e60a" width="250">
<br>
<br>

6. kode file about_screen.dart :

   - appBar: AppBar(title: row(...),); <br>
     AppBar: Menampilkan bar di bagian atas layar dengan judul "About BookKu" dan ikon informasi (Icons.info_outline). <br>
Row: Mengatur posisi ikon dan teks judul secara horizontal dengan sedikit jarak (SizedBox(width: 8)). <br>

   - body: padding(...); <br>
     Tampilan Utama dari About, dan Padding: Memberikan ruang di sekitar konten dengan jarak 16 piksel. <br>

   - RichText(
  textAlign: TextAlign.justify,
  text: TextSpan(
    text:
        'BookKu adalah aplikasi yang memudahkan kamu menemukan dan mereview berbagai buku...',
    style: TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
  ),
), <br>
     RichText: Digunakan untuk menampilkan teks panjang yang diatur perataan (textAlign: TextAlign.justify) agar lebih rapi. <br>
TextSpan: Komponen dasar dari teks yang dapat memiliki beberapa gaya (style). Di sini digunakan untuk menulis deskripsi singkat tentang aplikasi BookKu dengan ukuran teks sedang (16) dan warna hitam. <br>

   - Text(
  'Versi: 1.0.0',
  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
), <br>
     Menampilkan versi aplikasi di bagian bawah dengan ukuran font sedang (16) dan ketebalan sedang (fontWeight: FontWeight.w500). <br>
<br>
<img src="https://github.com/user-attachments/assets/d543f521-4dd4-4a25-ab77-08a60f021f2b" width="250">
<br>
<br>

7. kode file main.dart :

   - ChangeNotifierProvider(
  create: (_) => ThemeProvider(),
  child: Consumer<ThemeProvider>(
    builder: (context, themeProvider, _) {
      return MaterialApp(
        ...
      );
    },
  ),
); <br>
    ChangeNotifierProvider: Provider yang memungkinkan pengelolaan state global (dalam hal ini pengelolaan tema) menggunakan ThemeProvider. <br>
Consumer<ThemeProvider>: Komponen yang memantau perubahan tema. Jika ada perubahan pada state di ThemeProvider, widget di dalamnya akan di-rebuild. <br>

  - theme: themeProvider.isDarkMode
    ? ThemeData.dark().copyWith(
        primaryColor: Colors.cyan,
        colorScheme: ColorScheme.dark(
          primary: Colors.cyan,
          secondary: Colors.blueAccent,
        ),
      )
    : ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.light(
          primary: Colors.blue,
          secondary: Colors.cyan,
        ),
      ), <br>
     ThemeData.dark() dan ThemeData.light(): Menerapkan tema gelap atau terang sesuai dengan status isDarkMode yang dikelola di ThemeProvider. <br>
copyWith(): Menyesuaikan tema default dengan menambahkan warna primer dan sekunder, seperti Colors.cyan dan Colors.blueAccent. <br>

   - initialRoute: '/login',
routes: {
  '/': (context) => HomeScreen(),
  '/login': (context) => LoginScreen(),
  '/settings': (context) => SettingsScreen(),
  '/review': (context) => ReviewScreen(),
  '/about': (context) => AboutScreen(),
}, <br>
     initialRoute: Menentukan rute awal saat aplikasi dimulai, yaitu layar login ('/login'). <br>
routes: Daftar rute yang menghubungkan nama rute dengan layar tertentu. <br>

# DONE












 









     

