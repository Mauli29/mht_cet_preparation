import 'package:flutter/material.dart';
import '../core/app_routes.dart';

class TestResultsScreen extends StatelessWidget {
  const TestResultsScreen({super.key});

  static const Color primary = Color(0xFF2E0093);
  static const Color primaryContainer = Color(0xFF4520B8);
  static const Color secondary = Color(0xFF5E3ED5);
  static const Color onSurface = Color(0xFF1A1A2C);
  static const Color onSurfaceVariant = Color(0xFF484554);
  static const Color surfaceContainer = Color(0xFFEFEBFF);
  static const Color surfaceContainerHigh = Color(0xFFE9E5FF);
  static const Color surfaceLowest = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF8FF),
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: surfaceLowest.withValues(alpha: 0.8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                        style: IconButton.styleFrom(
                          foregroundColor: onSurface,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Exam Scorecard Results',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: onSurface,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          foregroundColor: onSurfaceVariant,
                        ),
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Celebration Hero
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: surfaceLowest,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.emoji_events,
                            color: Color(0xFFF5A623),
                            size: 48,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Test Completed!',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'MHT CET Full Length Mock Test #04',
                          style: TextStyle(
                            fontSize: 12,
                            color: onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Score Board
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: surfaceLowest,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'YOUR SCORE',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: onSurfaceVariant,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: primary,
                              ),
                              children: [
                                TextSpan(text: '178'),
                                TextSpan(
                                  text: ' / 200',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF797586),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: surfaceContainerHigh,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.workspace_premium,
                                    size: 16, color: secondary),
                                SizedBox(width: 6),
                                Text(
                                  'Top 1.6% • Est. Rank #142 in State',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF6F2FF).withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: surfaceLowest,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.02),
                                          blurRadius: 2,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: const Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.check_circle,
                                                size: 16,
                                                color: Color(0xFF32C794)),
                                            SizedBox(width: 4),
                                            Text('Correct',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Color(0xFF32C794))),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        Text('89',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: onSurface)),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: surfaceLowest,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.02),
                                          blurRadius: 2,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: const Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.cancel,
                                                size: 16,
                                                color: Color(0xFFBA1A1A)),
                                            SizedBox(width: 4),
                                            Text('Incorrect',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Color(0xFFBA1A1A))),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        Text('7',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: onSurface)),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: surfaceLowest,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.02),
                                          blurRadius: 2,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: const Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.remove_circle,
                                                size: 16,
                                                color: Color(0xFF797586)),
                                            SizedBox(width: 4),
                                            Text('Skipped',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Color(0xFF797586))),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        Text('4',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: onSurface)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Secondary Metrics
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: surfaceLowest,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Accuracy',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: onSurfaceVariant)),
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        color: surfaceContainer,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.track_changes,
                                          size: 16, color: primary),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const Text('92.7%',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: onSurface)),
                                const SizedBox(height: 2),
                                const Row(
                                  children: [
                                    Icon(Icons.arrow_upward,
                                        size: 14, color: Color(0xFF32C794)),
                                    SizedBox(width: 4),
                                    Text('+4.2% vs avg',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF32C794))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: surfaceLowest,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Time Taken',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: onSurfaceVariant)),
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        color: surfaceContainer,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.schedule,
                                          size: 16, color: secondary),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const Text('01:42:30',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: onSurface)),
                                const SizedBox(height: 2),
                                const Row(
                                  children: [
                                    Icon(Icons.timelapse,
                                        size: 14, color: Color(0xFF797586)),
                                    SizedBox(width: 4),
                                    Text('of 02:00:00',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF797586))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Subject-Wise Mastery
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: surfaceLowest,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subject Performance',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: onSurface)),
                              Text('PCM Group',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: secondary)),
                            ],
                          ),
                          const SizedBox(height: 16),

                          _SubjectProgress(
                              name: 'Physics',
                              score: '44',
                              total: '50',
                              percent: '88%',
                              value: 0.88,
                              color: secondary),
                          const SizedBox(height: 14),

                          _SubjectProgress(
                              name: 'Chemistry',
                              score: '46',
                              total: '50',
                              percent: '92%',
                              value: 0.92,
                              color: const Color(0xFF004E36)),
                          const SizedBox(height: 14),

                          _SubjectProgress(
                              name: 'Mathematics',
                              score: '88',
                              total: '100',
                              percent: '88%',
                              value: 0.88,
                              color: primary),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Insight
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE6DEFF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.psychology,
                                color: primary, size: 20),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Strong Hold on Calculus',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: onSurface)),
                                SizedBox(height: 2),
                                Text(
                                    'Accuracy is highest in Integration & Kinetics. Revise Rotational Dynamics.',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: onSurfaceVariant),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Actions
                    ElevatedButton.icon(
                      onPressed: () {
                         Navigator.pushNamed(context, AppRoutes.testAnalysis);
                      },
                      icon: const Text('View Detailed Analysis'),
                      label: const Icon(Icons.arrow_forward),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.replay),
                      label: const Text('Re-attempt Mock'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: surfaceLowest,
                        foregroundColor: primary,
                        minimumSize: const Size(double.infinity, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed: () {
                           Navigator.pushNamed(context, AppRoutes.home);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF797586),
                        ),
                        child: const Text('Back to Test Series Dashboard'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubjectProgress extends StatelessWidget {
  final String name;
  final String score;
  final String total;
  final String percent;
  final double value;
  final Color color;

  const _SubjectProgress({
    required this.name,
    required this.score,
    required this.total,
    required this.percent,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF1A1A2C),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A2C),
                ),
                children: [
                  TextSpan(text: score),
                  TextSpan(
                    text: ' / $total ($percent)',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF797586),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 8,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFE9E5FF),
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: value,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}