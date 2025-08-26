import 'package:flutter/material.dart';

class DetailInformasi extends StatelessWidget {
  final String title;
  final DateTime tgl;
  final String desc;
  final List<String> images;

  const DetailInformasi({
    super.key,
    required this.title,
    required this.tgl,
    required this.desc,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // gambar utama
            Image.network(
              images.first,
              width: double.infinity,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    "Tgl: $tgl",
                    style: const TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  const SizedBox(height: 8),
                  Text(desc, textAlign: TextAlign.justify),
                ],
              ),
            ),

            const Divider(),

            // gallery
            if (images.length > 1)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Foto Tambahan",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 8),

                    // ini yg bikin scroll horizontal bener
                    SizedBox(
                      height: 140,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(images.length - 1, (index) {
                            final imgUrl = images[index + 1];
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => Dialog(
                                    child: InteractiveViewer(
                                      child: Image.network(imgUrl,
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    imgUrl,
                                    width: 150,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
