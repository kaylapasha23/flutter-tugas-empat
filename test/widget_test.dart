import 'package:flutter_test/flutter_test.dart';
import 'package:widget_layout/main.dart'; // Sesuaikan jika nama proyek berbeda

void main() {
  testWidgets('Test Tiered Pricing Card', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Memastikan teks-teks utama di kartu muncul
    expect(find.text('Paket Profesional'), findsOneWidget);
    expect(find.text('Rekomendasi'), findsOneWidget);
    expect(find.text('Pilih Paket'), findsOneWidget);
  });
}