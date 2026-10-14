import 'package:flutter/material.dart';

void main() {
  runApp(const TechExpressApp());
}

// ======================================================
// APP
// ======================================================

class TechExpressApp extends StatelessWidget {
  const TechExpressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechExpress',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/main': (context) => const MainPage(),
        '/voucher': (context) => const VoucherPage(),
      },
    );
  }
}

// ======================================================
// LOGIN PAGE
// ======================================================

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login - Revantyo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 80),

              const SizedBox(height: 24),

              const Text(
                'Selamat datang di TechExpress',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/main',
                  );
                },
                child: const Text('Masuk ke Aplikasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================================================
// MAIN PAGE
// ======================================================

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    KatalogPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// ======================================================
// KATALOG PAGE
// ======================================================

class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data gadget
    final List<Map<String, String>> gadgets = [
      {
        'nama': 'iPhone 30 Pro',
        'harga': '5.000.000',
      },
      {
        'nama': 'Laptop Asus ROG',
        'harga': '12.000.000',
      },
      {
        'nama': 'Jam Tangan Rolex',
        'harga': '1.500.000',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TechExpress - Katalog'),
        automaticallyImplyLeading: false,
      ),

      body: ListView.builder(
        itemCount: gadgets.length,

        itemBuilder: (context, index) {
          final gadget = gadgets[index];

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),

            child: ListTile(
              contentPadding: const EdgeInsets.all(16),

              leading: const Icon(
                Icons.phone_android,
                size: 40,
                color: Colors.blue,
              ),

              title: Text(
                gadget['nama']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Rp ${gadget['harga']}',
                ),
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      namaGadget: gadget['nama']!,
                      hargaGadget: gadget['harga']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ======================================================
// PROFILE PAGE
// ======================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TechExpress Profile'),
        automaticallyImplyLeading: false,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.grey,
              ),

              const SizedBox(height: 16),

              const Text(
                'Kode Member: RVN001',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 32),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),

                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },

                child: const Text(
                  'Keluar / Logout',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================================================
// DETAIL PAGE
// ======================================================

class DetailPage extends StatefulWidget {
  final String namaGadget;
  final String hargaGadget;

  const DetailPage({
    super.key,
    required this.namaGadget,
    required this.hargaGadget,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String voucherTerpilih = 'Belum ada voucher dipilih';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail ${widget.namaGadget}',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon gadget
            const Center(
              child: Icon(
                Icons.devices,
                size: 120,
                color: Colors.blueAccent,
              ),
            ),

            const SizedBox(height: 24),

            // Nama gadget
            Text(
              'Nama: ${widget.namaGadget}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Harga gadget
            Text(
              'Harga: Rp ${widget.hargaGadget}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 16),

            // Voucher yang dipilih
            Text(
              'Voucher terpilih: $voucherTerpilih',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            ),

            const Spacer(),

            // Tombol voucher
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.local_offer,
                ),

                label: const Text(
                  'Klaim Voucher Diskon',
                ),

                onPressed: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    '/voucher',
                  );

                  if (result != null) {
                    setState(() {
                      voucherTerpilih = result.toString();
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// VOUCHER PAGE
// ======================================================

class VoucherPage extends StatelessWidget {
  const VoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Voucher'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Voucher 10%
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.local_offer,
                color: Colors.orange,
              ),

              title: const Text(
                'Diskon 10%',
              ),

              subtitle: const Text(
                'Dapatkan potongan harga sebesar 10%',
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),

              onTap: () {
                Navigator.pop(
                  context,
                  'Diskon 10%',
                );
              },
            ),
          ),

          // Voucher 20%
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.local_offer,
                color: Colors.orange,
              ),

              title: const Text(
                'Diskon 20%',
              ),

              subtitle: const Text(
                'Dapatkan potongan harga sebesar 20%',
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),

              onTap: () {
                Navigator.pop(
                  context,
                  'Diskon 20%',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}