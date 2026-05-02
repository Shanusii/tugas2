import 'package:flutter/material.dart';

void main() {
  runApp(const WireframeApp());
}

class WireframeApp extends StatelessWidget {
  const WireframeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wireframe Layout',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF424242), // Dark grey from wireframe
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const WireframeScreen(),
    );
  }
}

class WireframeScreen extends StatelessWidget {
  const WireframeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildDot(), _buildDot(), _buildDot()],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row 1: Two large rectangular placeholders
              Row(
                children: [
                  Expanded(child: _buildLargePlaceholder()),
                  const SizedBox(width: 20),
                  Expanded(child: _buildLargePlaceholder()),
                ],
              ),
              const SizedBox(height: 22),

              // Row 2: Three small orange squares with labels
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildFeatureItem()),
                  const SizedBox(width: 12),
                  Expanded(child: _buildFeatureItem()),
                  const SizedBox(width: 12),
                  Expanded(child: _buildFeatureItem()),
                ],
              ),
              const SizedBox(height: 32),

              // Row 3: Content lines
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),
              const SizedBox(height: 24),
              const Text(
                "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: 6,
      height: 6,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: const BoxDecoration(
        color: Colors.white70,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildLargePlaceholder() {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]!, width: 1),
          color: Colors.grey[50],
        ),
        child: Stack(
          children: [
            CustomPaint(
              size: Size.infinite,
              painter: CrossPainter(color: Colors.grey[400]!),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem() {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE69138), // Orange from wireframe
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Lorem Ipsum",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class CrossPainter extends CustomPainter {
  final Color color;
  CrossPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    canvas.drawLine(Offset.zero, Offset(size.width, size.height), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
