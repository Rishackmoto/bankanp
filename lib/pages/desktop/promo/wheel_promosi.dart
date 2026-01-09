import 'dart:async';
import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html; // hanya aktif di web
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const WheelOfKnowledgeApp());
}

// ----------------- AUDIO SECTION ----------------- //
final AudioPlayer _fxPlayer = AudioPlayer();
final AudioPlayer _musicPlayer = AudioPlayer();

Future<void> _initAudio() async {
  try {
    await _musicPlayer.setReleaseMode(ReleaseMode.loop);
    await _musicPlayer.setVolume(0.35);

    if (kIsWeb) {
      // 🌐 Web autoplay (opsi 2)
      final audio = html.AudioElement()
        ..src = 'assets/music/background.mp3'
        ..loop = true
        ..volume = 0.35;
      audio.play().catchError((e) {
        // Jika user belum interaksi, tampilkan tombol
        debugPrint('Autoplay diblokir browser: $e');
      });
    } else {
      // 📱 Mobile autoplay
      await _musicPlayer.setSource(AssetSource('assets/music/background.mp3'));
      await _musicPlayer.resume();
    }
  } catch (e) {
    debugPrint('Music load error: $e');
  }
}

Future<void> _playClick() async {
  if (kIsWeb) {
    try {
      final audio = html.AudioElement()..src = 'assets/music/click.wav';
      audio.play();
    } catch (e) {
      debugPrint('Click FX error (web): $e');
    }
  } else {
    try {
      await _fxPlayer.play(AssetSource('assets/music/click.mp3'));
    } catch (e) {
      debugPrint('Click FX error (mobile): $e');
    }
  }
}

Future<void> _playDing() async {
  if (kIsWeb) {
    try {
      final audio = html.AudioElement()..src = 'assets/music/ding.wav';
      audio.play();
    } catch (e) {
      debugPrint('Ding FX error (web): $e');
    }
  } else {
    try {
      await _fxPlayer.play(AssetSource('assets/music/ding.mp3'));
    } catch (e) {
      debugPrint('Ding FX error (mobile): $e');
    }
  }
}

Future<void> _toggleMusic(BuildContext context) async {
  if (kIsWeb) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Musik background di Web tidak otomatis.')),
    );
  } else {
    if (_musicPlayer.state == PlayerState.playing) {
      await _musicPlayer.pause();
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Musik dimatikan')));
    } else {
      await _musicPlayer.resume();
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Musik diputar')));
    }
  }
}

// ----------------- APP ----------------- //
class WheelOfKnowledgeApp extends StatelessWidget {
  const WheelOfKnowledgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const WheelScreen();
  }
}

class WheelScreen extends StatefulWidget {
  const WheelScreen({super.key});

  @override
  State<WheelScreen> createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen>
    with TickerProviderStateMixin {
  final StreamController<int> selected = StreamController<int>();
  final Random rng = Random();
  int? lastIndex;
  bool isSpinning = false;

  late final AnimationController glowController;
  Map<String, int> leaderboard = {};

  final List<Map<String, String>> questions = [
    {'q': '9. Kepanjangan dari OJK?', 'a': 'Otoritas Jasa Keuangan'},
    {
      'q': '1. Dua fungsi utama BPR?',
      'a': 'Menghimpun dana dan menyalurkan kredit kepada Masyarakat.',
    },
    {
      'q': '2. Tujuan utama inklusi keuangan?',
      'a': 'Agar seluruh lapisan masyarakat dapat mengakses layanan keuangan.',
    },
    {
      'q': '3. Produk apa saja yang biasanya dimiliki oleh BPR?',
      'a': 'Tabungan, deposito, kredit dan Layanan pembayaran.',
    },
    {
      'q': '4. Apa perbedaan BPR dan Bank Umum?',
      'a':
          'BPR tidak melayani transaksi valuta asing atau giro, fokus pada kredit mikro.',
    },
    {
      'q': '8. Siapa yang mengawasi BPR di Indonesia?',
      'a': 'Otoritas Jasa Keuangan (OJK).',
    },
    {'q': '11. Apa kepanjangan dari LPS?', 'a': 'Lembaga Penjamin Simpanan.'},
    {
      'q': '12. Apa fungsi utama LPS?',
      'a': 'Menjamin simpanan nasabah di bank agar dana masyarakat tetap aman.',
    },
    {
      'q': '13. Maksimal jumlah simpanan yang dijamin oleh LPS?',
      'a':
          'Hingga Rp2 miliar per nasabah per bank, sesuai syarat dan ketentuan yang berlaku.',
    },
    {
      'q': '5. Apa kepanjangan dari PERBARINDO?',
      'a': 'Perhimpunan Bank Perekonomian Rakyat Indonesia.',
    },
    {
      'q': '10. layanan digital perbankan!',
      'a': 'Mobile banking, internet banking, QRIS, dan e-wallet.',
    },
    {
      'q': '6. Mengapa literasi keuangan itu penting?',
      'a': 'Agar masyarakat bisa mengelola keuangan dengan bijak dan aman.',
    },
    {
      'q': '7. Apa peran BPR dalam mendukung UMKM?',
      'a':
          'Memberikan pembiayaan mudah dan cepat bagi usaha kecil dan menengah.',
    },
    {
      'q': 'Apa alat untuk membayar tanpa uang tunai?',
      'a': 'Kartu debit, e-wallet, atau QRIS.',
    },
    {
      'q': 'Apa yang dimaksud dengan QRIS?',
      'a': 'Kode QR standar nasional untuk pembayaran non-tunai.',
    },
    {
      'q': 'Siapa yang bisa menabung di BPR?',
      'a': 'Semua orang dari berbagai kalangan masyarakat.',
    },
    {
      'q': 'Apa warna logo OJK?',
      'a': 'Merah dan abu-abu.',
    },
    {
      'q': 'Untuk apa orang pergi ke bank?',
      'a': 'Untuk menabung, mengambil uang, atau membayar tagihan.',
    },
    {
      'q': 'Apa kepanjangan dari ATM?',
      'a': 'Anjungan Tunai Mandiri.',
    },
  ];

  final List<Color> sectorColors = [
    const Color(0xFF0057B7),
    const Color(0xFFFFD700),
  ];

  @override
  void initState() {
    super.initState();
    glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    _initAudio();
    _loadLeaderboard();
  }

  Future<void> _loadLeaderboard() async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, int> loaded = {};
    for (final k in prefs.getKeys()) {
      if (k.startsWith('lb_')) {
        loaded[k.replaceFirst('lb_', '')] = prefs.getInt(k) ?? 0;
      }
    }
    if (!mounted) return;
    setState(() => leaderboard = loaded);
  }

  Future<void> _saveLeaderboardLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where((k) => k.startsWith('lb_')).toList();
    for (final k in keys) {
      await prefs.remove(k);
    }
    for (final entry in leaderboard.entries) {
      await prefs.setInt('lb_${entry.key}', entry.value);
    }
  }

  Future<void> _exportLeaderboardToCSV() async {
    if (leaderboard.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Leaderboard masih kosong')));
      return;
    }

    const header = 'Nama,Poin\n';
    final rows =
        leaderboard.entries.map((e) => '${e.key},${e.value}').join('\n');
    final csv = header + rows;

    if (kIsWeb) {
      final bytes = utf8.encode(csv);
      final blob = html.Blob([Uint8List.fromList(bytes)], 'text/csv');
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.AnchorElement(href: url)
        ..setAttribute('download', 'leaderboard.csv')
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      debugPrint('CSV content:\n$csv');
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Leaderboard disimpan ke CSV')),
    );
  }

  @override
  void dispose() {
    glowController.dispose();
    selected.close();
    _musicPlayer.dispose();
    _fxPlayer.dispose();
    super.dispose();
  }

  Future<void> _spin() async {
    if (isSpinning) return;
    setState(() => isSpinning = true);
    await _playClick();

    final idx = rng.nextInt(questions.length);
    selected.add(idx);

    for (int i = 0; i < 6; i++) {
      Future.delayed(Duration(milliseconds: i * 120), () => _playClick());
    }

    await Future.delayed(const Duration(milliseconds: 4200));
    await _playDing();

    setState(() {
      isSpinning = false;
      lastIndex = idx;
    });
    _showQuestionDialog(idx);
  }

  void _showQuestionDialog(int idx) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pertanyaan'),
        content: Text(questions[idx]['q'] ?? ''),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showAnswerDialog(idx);
            },
            child: const Text('Lihat Jawaban'),
          ),
        ],
      ),
    );
  }

  void _showAnswerDialog(int idx) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Jawaban'),
        content: Text(questions[idx]['a'] ?? ''),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kembali'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _recordWinnerFlow();
            },
            child: const Text('Saya Benar - Simpan'),
          ),
        ],
      ),
    );
  }

  Future<void> _recordWinnerFlow() async {
    final name = await showDialog<String>(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text('Simpan Poin'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'Nama Peserta'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, controller.text.trim()),
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );

    if (name == null || name.isEmpty) return;
    setState(() => leaderboard.update(name, (v) => v + 1, ifAbsent: () => 1));
    await _saveLeaderboardLocal();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Poin tersimpan!')));
  }

  Widget _buildGlowWheel(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.7;
    return Stack(
      alignment: Alignment.center,
      children: [
        RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(glowController),
          child: Container(
            width: size + 40,
            height: size + 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
          ),
        ),
        SizedBox(
          width: size,
          height: size,
          child: FortuneWheel(
            selected: selected.stream,
            items: List.generate(questions.length, (i) {
              final bg = sectorColors[i % sectorColors.length];
              final textColor =
                  (bg == const Color(0xFFFFD700)) ? Colors.black : Colors.white;
              return FortuneItem(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Transform.translate(
                    offset: const Offset(80, 0),
                    child: Text(
                      '${i + 1}',
                      style: TextStyle(
                        fontSize: 50,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                style: FortuneItemStyle(
                  color: bg,
                  borderColor: Colors.white,
                  borderWidth: 2,
                ),
              );
            }),
            indicators: const [
              FortuneIndicator(
                alignment: Alignment.topCenter,
                child: TriangleIndicator(color: Colors.red),
              ),
            ],
            rotationCount: 6,
            curve: Curves.decelerate,
          ),
        ),
        Container(
          width: size * 0.28,
          height: size * 0.28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade200],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Image.asset('assets/images/bik.png', height: size * 2.10),
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardCard() {
    final entries = leaderboard.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text(
              'Leaderboard',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (entries.isEmpty)
              const Text(
                'Belum ada pemenang',
                style: TextStyle(color: Colors.grey),
              )
            else
              SizedBox(
                height: 420,
                child: ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (_, i) {
                    final e = entries[i];
                    return ListTile(
                      dense: true,
                      title: Text(e.key),
                      trailing: Text('${e.value} pts'),
                    );
                  },
                ),
              ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: _exportLeaderboardToCSV,
              icon: const Icon(Icons.download),
              label: const Text('Export ke CSV'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 🎬 Background Lottie Animation
          Container(
            color: const Color(0xFF00041c),
            child: Lottie.asset(
              'assets/lottie/bg3.json',
              fit: BoxFit.contain,
              repeat: true,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logobpr.png', height: 50),
                      const SizedBox(width: 10),
                      const Text(
                        'RODA PENGETAHUAN BPR & INKLUSI KEUANGAN 2025',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: isWide
                        ? Row(
                            children: [
                              Expanded(
                                child: Center(child: _buildGlowWheel(context)),
                              ),
                              const SizedBox(width: 16),
                              SizedBox(
                                width: 320,
                                child: _buildLeaderboardCard(),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Expanded(
                                child: Center(child: _buildGlowWheel(context)),
                              ),
                              const SizedBox(height: 12),
                              _buildLeaderboardCard(),
                            ],
                          ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: isSpinning ? null : _spin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD700),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        isSpinning ? 'Sedang Berputar...' : '🎁 PUTAR RODA',
                        style: const TextStyle(
                          color: Color(0xFF0057B7),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () => _toggleMusic(context),
                    icon: const Icon(Icons.music_note),
                    label: const Text('Toggle Musik'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
