import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const _backgroundTop = Color(0xFF8053F5);
  static const _backgroundMiddle = Color(0xFF5424C4);
  static const _backgroundBottom = Color(0xFF35108F);

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/create-account');
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_backgroundTop, _backgroundMiddle, _backgroundBottom],
              stops: [0, 0.58, 1],
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              const IgnorePointer(
                child: CustomPaint(painter: _AtmospherePainter()),
              ),
              SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final markSize = (constraints.maxWidth * 0.24).clamp(
                      72.0,
                      96.0,
                    );

                    return Column(
                      children: [
                        SizedBox(height: constraints.maxHeight * 0.15),
                        _GraduationMark(size: markSize),
                        const SizedBox(height: 27),
                        const Text(
                          'MHT CET Preparation',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          'Dream  •  Prepare  •  Achieve',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.83),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.25,
                          ),
                        ),
                        const SizedBox(height: 17),
                        const Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _StreamBadge(
                              icon: Icons.science_outlined,
                              label: 'PCM • Engineering',
                            ),
                            _StreamBadge(
                              icon: Icons.biotech_outlined,
                              label: 'PCB • Pharmacy',
                            ),
                          ],
                        ),
                        const Spacer(flex: 3),
                        const _LoadingIndicator(),
                        const Spacer(flex: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Maharashtra Common Entrance Test',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.57),
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'v2.4.0',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.57),
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GraduationMark extends StatelessWidget {
  const _GraduationMark({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size + 12,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF9B80FF), Color(0xFF5C32D0)],
              ),
              border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1E075E).withValues(alpha: 0.25),
                  blurRadius: 28,
                  offset: const Offset(0, 12),
                ),
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.12),
                  blurRadius: 20,
                  spreadRadius: -8,
                ),
              ],
            ),
            child: const Icon(
              Icons.school_rounded,
              color: Color(0xFFE9E2FF),
              size: 44,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFF50D6A0),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF6638D9), width: 2),
              ),
              child: const Text(
                '2025 EDITION',
                style: TextStyle(
                  color: Color(0xFF173C43),
                  fontSize: 7,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StreamBadge extends StatelessWidget {
  const _StreamBadge({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: Colors.white.withValues(alpha: 0.9)),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white.withValues(alpha: 0.88),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'READY TO RECALL',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.78),
            fontSize: 8,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
          ),
        ),
      ],
    );
  }
}

class _AtmospherePainter extends CustomPainter {
  const _AtmospherePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final glowPaint = Paint()
      ..shader =
          RadialGradient(
            colors: [
              Colors.white.withValues(alpha: 0.12),
              Colors.white.withValues(alpha: 0),
            ],
          ).createShader(
            Rect.fromCircle(
              center: Offset(size.width * 0.5, size.height * 0.34),
              radius: size.width * 0.72,
            ),
          );
    canvas.drawRect(Offset.zero & size, glowPaint);

    final skyline = Path()
      ..moveTo(0, size.height * 0.91)
      ..lineTo(size.width * 0.14, size.height * 0.91)
      ..lineTo(size.width * 0.14, size.height * 0.875)
      ..lineTo(size.width * 0.18, size.height * 0.875)
      ..lineTo(size.width * 0.18, size.height * 0.90)
      ..lineTo(size.width * 0.34, size.height * 0.90)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.86,
        size.width * 0.64,
        size.height * 0.90,
      )
      ..lineTo(size.width * 0.78, size.height * 0.90)
      ..lineTo(size.width * 0.78, size.height * 0.87)
      ..lineTo(size.width * 0.82, size.height * 0.87)
      ..lineTo(size.width * 0.82, size.height * 0.90)
      ..lineTo(size.width, size.height * 0.90)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      skyline,
      Paint()..color = const Color(0xFF20076C).withValues(alpha: 0.2),
    );

    final ridge = Path()
      ..moveTo(0, size.height * 0.94)
      ..lineTo(size.width * 0.2, size.height * 0.92)
      ..lineTo(size.width * 0.36, size.height * 0.935)
      ..lineTo(size.width * 0.5, size.height * 0.91)
      ..lineTo(size.width * 0.66, size.height * 0.935)
      ..lineTo(size.width * 0.84, size.height * 0.92)
      ..lineTo(size.width, size.height * 0.94)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      ridge,
      Paint()..color = const Color(0xFF17045E).withValues(alpha: 0.23),
    );
  }

  @override
  bool shouldRepaint(covariant _AtmospherePainter oldDelegate) => false;
}
