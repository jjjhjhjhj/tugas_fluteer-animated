import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final iconList = <IconData>[
    Icons.home,
    Icons.message,
    Icons.notifications,
    Icons.person,
  ];

  final pages = [HomePage(), MessagePage(), NotificationPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Text(
              'APLIKASI KU',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 35,
                fontWeight: FontWeight.bold,
                foreground:
                    Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.orange,
              ),
            ),
            Text(
              'APLIKASI KU',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 32),
        backgroundColor: Colors.orange,
        shape: CircleBorder(),
        elevation: 8,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: Colors.white,
        activeColor: Colors.orange,
        inactiveColor: Colors.grey,
      ),
    );
  }
}

// ===== Halaman: HomePage =====
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.home, size: 100, color: Colors.orange),
          SizedBox(height: 20),
          Text(
            'Selamat Datang di Beranda!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Temukan fitur-fitur menarik di aplikasi ini.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ===== Halaman: MessagePage =====
class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          'Pesan Masuk',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        MessageTile(sender: 'Admin', message: 'Selamat datang di aplikasi!'),
        MessageTile(
          sender: 'Sistem',
          message: 'Update versi terbaru tersedia.',
        ),
      ],
    );
  }
}

class MessageTile extends StatelessWidget {
  final String sender;
  final String message;

  const MessageTile({required this.sender, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(Icons.message, color: Colors.orange),
        title: Text(sender),
        subtitle: Text(message),
      ),
    );
  }
}

// ===== Halaman: NotificationPage =====
class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          'Notifikasi Terbaru',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        NotificationTile(
          title: 'Promo Baru!',
          subtitle: 'Dapatkan diskon 20% untuk pengguna baru.',
        ),
        NotificationTile(
          title: 'Pengingat',
          subtitle: 'Lengkapi profil Anda untuk pengalaman lebih baik.',
        ),
      ],
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const NotificationTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(Icons.notifications, color: Colors.orange),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

// ===== Halaman: ProfilePage =====
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.orange, // Memberikan warna latar belakang
            child: Icon(
              Icons.person, // Ganti dengan ikon yang diinginkan
              size: 60, // Ukuran ikon
              color: Colors.white, // Warna ikon
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Dina Asritama Wulandari',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'asriw05@gmail.com',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
