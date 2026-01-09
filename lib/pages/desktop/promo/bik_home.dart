// lib/main.dart
import 'dart:html' as html; // target: Flutter Web
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const HomeBIK());
}

class HomeBIK extends StatelessWidget {
  const HomeBIK({super.key});

  @override
  Widget build(BuildContext context) {
    return const LandingPage();
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // Audio players: for web we use html.AudioElement for background music (more reliable for autoplay)
  final AudioPlayer _mobileMusic = AudioPlayer();
  html.AudioElement? _webAudio;
  bool _isMusicPlaying = false;

  final String landingUrl =
      'https://bankanp.com/#/bik2025'; // QR target (ubah bila perlu)

  final List<Map<String, String>> bprList = [
    {
      'name': 'BPR Anak Negeri Papua',
      'city': 'Kota Jayapura',
      'url': 'https://bankanp.com',
    },
    {
      'name': 'BPR Pidhectama Abepura',
      'city': 'Kota Abepura',
      'url': 'https://bprphidectamaabepura.com',
    },
    {
      'name': 'BPR Papua Mandiri',
      'city': 'Kota Jayapura',
      'url': 'https://bprpapuamadiri.co.id',
    },
    {'name': 'BPR Suni', 'city': 'Kota Jayapura', 'url': 'https://bprsuni.com'},
    {
      'name': 'BPR Nusa Intim',
      'city': 'Kabupaten Jayapura',
      'url': 'https://bprnusaintim.co.id',
    },
    {
      'name': 'BPR Modern Express',
      'city': 'Cabang Jayapura',
      'url': 'https://bprmodex.com',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Prepare web audio element (but don't force play; browsers may block autoplay)
    if (kIsWeb) {
      _webAudio = html.AudioElement()
        ..src = 'assets/music/background.mp3'
        ..loop = true
        ..volume = 0.35;
      // try to auto-play — may be blocked until user interacts
      _webAudio!.play().then((_) {
        setState(() => _isMusicPlaying = true);
      }).catchError((e) {
        // autoplay blocked — keep it paused until user taps
        debugPrint('Autoplay blocked or error: $e');
        _isMusicPlaying = false;
      });
    } else {
      // non-web fallback: preload but don't autoplay
      _mobileMusic.setReleaseMode(ReleaseMode.loop);
    }
  }

  @override
  void dispose() {
    if (kIsWeb) {
      _webAudio?.pause();
      _webAudio?.src = '';
      _webAudio = null;
    } else {
      _mobileMusic.stop();
      _mobileMusic.dispose();
    }
    super.dispose();
  }

  Future<void> toggleMusic() async {
    if (kIsWeb) {
      if (_webAudio == null) return;
      if (_isMusicPlaying) {
        _webAudio!.pause();
        setState(() => _isMusicPlaying = false);
      } else {
        try {
          await _webAudio!.play();
          setState(() => _isMusicPlaying = true);
        } catch (e) {
          debugPrint('Play error web audio: $e');
        }
      }
    } else {
      if (_isMusicPlaying) {
        await _mobileMusic.pause();
        setState(() => _isMusicPlaying = false);
      } else {
        try {
          await _mobileMusic.play(AssetSource('assets/music/mars.mp3'));
          setState(() => _isMusicPlaying = true);
        } catch (e) {
          debugPrint('Play error mobile audio: $e');
        }
      }
    }
  }

  // Quick function to open the spin game on new tab/window
  void openSpinGame() {
    html.window.open(landingUrl, 'https://bankanp.com/#/gamebik');
  }

  Widget _buildHeader(BuildContext ctx) {
    return Row(
      children: [
        Image.asset('assets/images/logobpr.png', height: 56),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            'Gerakan Inklusi Keuangan Papua 2025',
            style: Theme.of(ctx).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        IconButton(
          onPressed: toggleMusic,
          color: Colors.white,
          icon: Icon(_isMusicPlaying ? Icons.music_note : Icons.music_off),
          tooltip: _isMusicPlaying ? 'Matikan Musik' : 'Putar Musik',
        ),
      ],
    );
  }

  Widget _buildHero(double width) {
    final isNarrow = width < 700;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: isNarrow
          ? Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bpr.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 220,
                    child: Image.asset('assets/images/bik.png', height: 56),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Bersama BPR, Wujudkan Papua Inklusif Secara Keuangan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '7 BPR di bawah PERBARINDO Papua berkomitmen membawa layanan keuangan ke seluruh masyarakat.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: openSpinGame,
                    icon: const Icon(Icons.open_in_new),
                    label: const Text('Kunjungi Wheel of Knowledge'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD600),
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Bersama BPR, Wujudkan Papua Inklusif Secara Keuangan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '7 BPR di bawah PERBARINDO Papua berkomitmen membawa layanan keuangan ke seluruh masyarakat — edukasi, tabungan, dan pembiayaan mikro untuk kesejahteraan.',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.95),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: openSpinGame,
                              icon: const Icon(Icons.open_in_new),
                              label: const Text('Kunjungi Wheel of Knowledge'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFD600),
                                foregroundColor: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 12),
                            OutlinedButton.icon(
                              onPressed: () {
                                // scroll to BPR list or do other action
                                // we'll just show a Snackbar for now
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Scroll ke daftar BPR...'),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.list),
                              label: const Text('Lihat Daftar BPR'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 380,
                  height: 240,
                  child: Image.asset('assets/images/bik.png', height: 56),
                ),
              ],
            ),
    );
  }

  Widget _buildBprCard(Map<String, String> bpr) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      child: InkWell(
        onTap: () {
          final url = bpr['url'];
          if (url != null && url.isNotEmpty) {
            html.window.open(url, '_blank');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Website ${bpr['name']} belum tersedia')),
            );
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/iBank.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bpr['name'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      bpr['city'] ?? '',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  // Copy name to clipboard or open page later
                  html.window.navigator.clipboard?.writeText(bpr['name'] ?? '');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nama BPR disalin ke clipboard'),
                    ),
                  );
                },
                icon: const Icon(Icons.copy_all),
                color: Colors.grey.shade700,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBprGrid(double width) {
    final crossAxis = width > 1000
        ? 3
        : width > 700
            ? 2
            : 1;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: bprList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxis,
        mainAxisExtent: 100,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (_, idx) => _buildBprCard(bprList[idx]),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mengapa Inklusi Keuangan?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text(
            'Inklusi keuangan memudahkan masyarakat mengakses layanan tabungan, pembiayaan, dan pembayaran digital. '
            'Dengan literasi yang tepat, keluarga dan UMKM di Papua dapat bertumbuh lebih cepat dan lebih aman.',
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _statTile('7', 'BPR di Papua')),
              Expanded(
                child: _statTile('100+', 'Kegiatan Edukasi (tahun ini)'),
              ),
              Expanded(
                child: _statTile('10K+', 'Masyarakat Terlayani (estimasi)'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statTile(String big, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          big,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF063970),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }

  Widget _buildFooter(double width) {
    return Column(
      children: [
        const Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PERBARINDO Wilayah Papua',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Bersama BPR, Mewujudkan Papua Yang Lebih Inklusif Secara Keuangan.',
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () => html.window.open(landingUrl, '_blank'),
                        icon: const Icon(Icons.open_in_new),
                        label: const Text('Kunjungi Website'),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            // QR Code
            SizedBox(
              width: 160,
              child: Column(
                children: [
                  const Text(
                    'Scan untuk ke website',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: QrImageView(
                        data: landingUrl,
                        version: QrVersions.auto,
                        size: 120,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  SelectableText(
                    landingUrl,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          '© ${DateTime.now().year} PERBARINDO Papua — All rights reserved',
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isWide = w > 1000;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 28.0,
                    horizontal: 18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ✅ HEADER / NAV
                      SizedBox(
                        width: double.infinity,
                        child: _buildHeader(context),
                      ),
                      const SizedBox(height: 20),

                      // ✅ HERO SECTION
                      _buildHero(w),
                      const SizedBox(height: 30),

                      // ✅ RESPONSIVE CONTENT
                      if (isWide)
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // LEFT SIDE
                              Flexible(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Anggota BPR (Perbarindo) di Papua',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    _buildBprGrid(w),
                                    const SizedBox(height: 18),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 24),

                              // RIGHT SIDE
                              Flexible(
                                flex: 1,
                                child: Column(
                                  children: [
                                    _buildAboutSection(),
                                    const SizedBox(height: 18),
                                    _buildFooter(w),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Anggota BPR (Perbarindo) di Papua',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildBprGrid(w),
                            const SizedBox(height: 18),
                            _buildAboutSection(),
                            const SizedBox(height: 18),
                            _buildFooter(w),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
