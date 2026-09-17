import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Katalog Paket IT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// Model data katalog
class PackageItem {
  final String title;
  final String price;
  final String description;
  final List<String> features;
  final String badgeText;

  PackageItem({
    required this.title,
    required this.price,
    required this.description,
    required this.features,
    this.badgeText = 'Populer',
  });
}

// -----------------------------------------------------------------------------
// SCREEN 1: BERANDA (StatelessWidget) 
// -----------------------------------------------------------------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PackageItem> packages = [
      PackageItem(
        title: 'Paket Dasar',
        price: 'Rp 1.500.000',
        description:
            'Solusi tepat untuk UMKM dan personal yang membutuhkan website landing page profesional.',
        features: ['Desain Responsive', '1 Halaman Utama', 'Form Kontak'],
        badgeText: 'Hemat',
      ),
      PackageItem(
        title: 'Paket Profesional',
        price: 'Rp 5.000.000',
        description:
            'Solusi terbaik untuk kebutuhan sistem dan pengembangan IT tingkat lanjut bisnis Anda.',
        features: [
          'Desain UI/UX Khusus',
          'Setup Database',
          'Integrasi API',
          'Dukungan Teknis 24/7'
        ],
        badgeText: 'Rekomendasi',
      ),
      PackageItem(
        title: 'Paket Enterprise',
        price: 'Rp 12.000.000',
        description:
            'Layanan kustom skala besar dengan infrastruktur cloud dan keamanan tingkat tinggi.',
        features: [
          'Full-Stack Custom App',
          'Arsitektur Microservices',
          'Garansi Pemeliharaan 1 Tahun'
        ],
        badgeText: 'Lengkap',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Katalog Layanan IT'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final item = packages[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.laptop_mac, color: Colors.white),
              ),
              title: Row(
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  // Menampilkan badgeText 
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      item.badgeText,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Text('${item.price} / proyek'),
              trailing: const Icon(Icons.chevron_right),
              // Navigasi Stack (Navigator.push)
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
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

// -----------------------------------------------------------------------------
// SCREEN 2: DETAIL KATALOG (StatefulWidget) - 
// -----------------------------------------------------------------------------
class DetailScreen extends StatefulWidget {
  final PackageItem item;

  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // State interaktif 
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      // AppBar otomatis menampilkan tombol kembali tanpa 'leading' manual 
      appBar: AppBar(
        title: Text(widget.item.title),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      // Layout vertikal menggunakan Column 
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon & Nama Katalog / Harga 
            Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.laptop_mac,
                    size: 70,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.item.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${widget.item.price} / proyek',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Container deskripsi 
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD), 
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi Paket',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.item.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Daftar Fitur
            const Text(
              'Fitur Layanan:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: widget.item.features
                  .map(
                    (feature) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle,
                              color: Colors.green, size: 20),
                          const SizedBox(width: 10),
                          Text(feature, style: const TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 32),

            // Elemen Interaktif & State Management 
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                // Event: onPressed
                onPressed: () {
                  // State update: setState()
                  setState(() {
                    isSelected = !isSelected;
                  });

                  // Umpan balik visual saat state berubah
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isSelected
                            ? '${widget.item.title} berhasil dipilih!'
                            : 'Pilihan ${widget.item.title} dibatalkan.',
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isSelected ? Colors.green : Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  isSelected ? 'Paket Terpilih ✓' : 'Pilih Paket Ini',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}