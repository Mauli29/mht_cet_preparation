import 'package:flutter/material.dart';
import '../core/app_routes.dart';

class TestAnalysisScreen extends StatelessWidget {
  const TestAnalysisScreen({super.key});

  static const Color primary = Color(0xFF2E0093);
  static const Color primaryContainer = Color(0xFF4520B8);
  static const Color onSurface = Color(0xFF1A1A2C);
  static const Color onSurfaceVariant = Color(0xFF484554);
  static const Color surfaceContainer = Color(0xFFEFEBFF);
  static const Color surfaceContainerLow = Color(0xFFF6F2FF);
  static const Color surfaceContainerHigh = Color(0xFFE9E5FF);
  static const Color surfaceLowest = Color(0xFFFFFFFF);
  static const Color tertiary = Color(0xFF003524);
  static const Color tertiaryContainer = Color(0xFF004E36);
  static const Color secondary = Color(0xFF5E3ED5);
  static const Color errorColor = Color(0xFFBA1A1A);

  Widget _buildMetricCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String label,
    required String value,
    required String subtext,
    required Color subtextColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 18),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtext,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: subtextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionCard({
    required String qNumber,
    required Color qBgColor,
    required Color qTextColor,
    required String topic,
    required String markText,
    required IconData markIcon,
    required Color markColor,
    required Color markBgColor,
    required String questionText,
    required String timeText,
    required String optionText,
    required Color optionColor,
    required IconData optionIcon,
    required Color actionBgColor,
    required Color actionTextColor,
    required String actionText,
    required IconData actionIcon,
    bool isError = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isError)
            Container(
              width: 4,
              height: 60,
              decoration: BoxDecoration(
                color: errorColor,
                borderRadius: BorderRadius.circular(2),
              ),
              margin: const EdgeInsets.only(right: 12),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: qBgColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            qNumber,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: qTextColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          topic,
                          style: const TextStyle(
                            fontSize: 11,
                            color: onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: markBgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(markIcon, size: 14, color: markColor),
                          const SizedBox(width: 4),
                          Text(
                            markText,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: markColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  questionText,
                  style: const TextStyle(
                    fontSize: 14,
                    color: onSurface,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: actionBgColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isError) ...[
                            Text(
                              optionText,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: optionColor,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(Icons.schedule,
                                    size: 14, color: onSurfaceVariant),
                                const SizedBox(width: 4),
                                Text(
                                  timeText,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ] else ...[
                            Row(
                              children: [
                                const Icon(Icons.schedule,
                                    size: 15, color: onSurfaceVariant),
                                const SizedBox(width: 4),
                                Text(
                                  timeText,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: onSurfaceVariant,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Icon(optionIcon, size: 15, color: optionColor),
                                const SizedBox(width: 4),
                                Text(
                                  optionText,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: optionColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                      if (isError)
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryContainer,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 0),
                            minimumSize: const Size(0, 28),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'View Solution',
                            style: TextStyle(fontSize: 11),
                          ),
                        )
                      else
                        Row(
                          children: [
                            Text(
                              actionText,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: actionTextColor,
                              ),
                            ),
                            const SizedBox(width: 2),
                            Icon(actionIcon, size: 16, color: actionTextColor),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
                        'Test Analysis & Breakdown',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: onSurface,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          foregroundColor: onSurfaceVariant,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          foregroundColor: onSurfaceVariant,
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
                    // Hero Score Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF4520B8),
                            Color(0xFF5E3ED5),
                            Color(0xFF4520B8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.military_tech,
                                        size: 14, color: Colors.white),
                                    SizedBox(width: 4),
                                    Text(
                                      'Rank #142 / 12,450',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'MOCK TEST #04 • PCM GROUP',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFFCABEFF),
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              const Text(
                                '178',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                '/ 200',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFFCABEFF),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF70FBC4),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.trending_up,
                                        size: 13, color: Color(0xFF002115)),
                                    SizedBox(width: 4),
                                    Text(
                                      '98.4 %ile',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF002115),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('State Standing',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFFCABEFF))),
                                    Text('Top 1.2%',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Accuracy',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFFCABEFF))),
                                    Text('92.7%',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF70FBC4))),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Total Time',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFFCABEFF))),
                                    Text('1h 42m',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Subject Breakdown
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'SUBJECT BREAKDOWN',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: onSurfaceVariant,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    const Text('All Subjects',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white)),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Text('100 Qs',
                                          style: TextStyle(
                                              fontSize: 11, color: Colors.white)),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: surfaceContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                            color: Color(0xFF775AEF),
                                            shape: BoxShape.circle)),
                                    const SizedBox(width: 8),
                                    const Text('Physics',
                                        style: TextStyle(
                                            fontSize: 12, color: onSurface)),
                                    const SizedBox(width: 8),
                                    const Text('44/50',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: primary)),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: surfaceContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                            color: Color(0xFF50DEA9),
                                            shape: BoxShape.circle)),
                                    const SizedBox(width: 8),
                                    const Text('Chemistry',
                                        style: TextStyle(
                                            fontSize: 12, color: onSurface)),
                                    const SizedBox(width: 8),
                                    const Text('46/50',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: primary)),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: surfaceContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                            color: Color(0xFF6043D3),
                                            shape: BoxShape.circle)),
                                    const SizedBox(width: 8),
                                    const Text('Maths',
                                        style: TextStyle(
                                            fontSize: 12, color: onSurface)),
                                    const SizedBox(width: 8),
                                    const Text('88/100',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: primary)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Core Diagnostics
                    Row(
                      children: [
                        _buildMetricCard(
                          icon: Icons.timer,
                          iconColor: primary,
                          iconBgColor: const Color(0xFFE3E0FA),
                          label: 'Avg Pace',
                          value: '49s',
                          subtext: 'Target: 60s',
                          subtextColor: tertiaryContainer,
                        ),
                        const SizedBox(width: 10),
                        _buildMetricCard(
                          icon: Icons.verified,
                          iconColor: tertiary,
                          iconBgColor: tertiaryContainer.withValues(alpha: 0.15),
                          label: 'Accuracy',
                          value: '92.7%',
                          subtext: 'State: 68%',
                          subtextColor: tertiary,
                        ),
                        const SizedBox(width: 10),
                        _buildMetricCard(
                          icon: Icons.security,
                          iconColor: secondary,
                          iconBgColor: const Color(0xFFE6DEFF),
                          label: 'Negative',
                          value: '0.0',
                          subtext: 'Protected',
                          subtextColor: onSurfaceVariant,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Pacing Strategy
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: surfaceContainer,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: const BoxDecoration(
                                      color: primaryContainer,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.bolt,
                                        color: Colors.white, size: 18),
                                  ),
                                  const SizedBox(width: 8),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Pacing & Strategy',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: onSurface)),
                                      Text('Optimal examination allocation',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: onSurfaceVariant)),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: tertiaryContainer.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text('+8m Saved',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: tertiary)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 12,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFDBD7F1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 22,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF775AEF),
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(6)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 28,
                                  child: Container(color: const Color(0xFF50DEA9)),
                                ),
                                Expanded(
                                  flex: 50,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(6)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF775AEF),
                                          shape: BoxShape.circle)),
                                  const SizedBox(width: 4),
                                  const Text('Phy (22m)',
                                      style: TextStyle(
                                          fontSize: 11, color: onSurfaceVariant)),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF50DEA9),
                                          shape: BoxShape.circle)),
                                  const SizedBox(width: 4),
                                  const Text('Chem (28m)',
                                      style: TextStyle(
                                          fontSize: 11, color: onSurfaceVariant)),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                          color: primary,
                                          shape: BoxShape.circle)),
                                  const SizedBox(width: 4),
                                  const Text('Math (52m)',
                                      style: TextStyle(
                                          fontSize: 11, color: onSurfaceVariant)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.tips_and_updates,
                                    size: 20, color: secondary),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                          fontSize: 12, color: onSurface),
                                      children: [
                                        TextSpan(
                                            text: 'Chemistry was completed '),
                                        TextSpan(
                                            text: '8 minutes faster',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text:
                                                ' than average without compromising accuracy (92%). This extra budget fortified your Mathematics calculus section!'),
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

                    // Question Audit
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Question Audit',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: onSurface)),
                        const Text('Showing 5 of 100',
                            style: TextStyle(
                                fontSize: 11, color: onSurfaceVariant)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: surfaceContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: surfaceLowest,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 2,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: const Text('All (100)',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: primary)),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF50DEA9),
                                        shape: BoxShape.circle)),
                                const SizedBox(width: 4),
                                const Text('89',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: onSurfaceVariant)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                        color: errorColor,
                                        shape: BoxShape.circle)),
                                const SizedBox(width: 4),
                                const Text('7',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: onSurfaceVariant)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF797586),
                                        shape: BoxShape.circle)),
                                const SizedBox(width: 4),
                                const Text('4',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: onSurfaceVariant)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Question List Stream
                    _buildQuestionCard(
                      qNumber: 'Q.01',
                      qBgColor: surfaceContainerHigh,
                      qTextColor: primary,
                      topic: 'Physics • Units & Measurements',
                      markText: '+1.0',
                      markIcon: Icons.check,
                      markColor: const Color(0xFF002115),
                      markBgColor: const Color(0xFF70FBC4),
                      questionText:
                          'The acceleration due to gravity on the Earth\'s surface is represented by standard dimensions. What is the dimensional formula for acceleration?',
                      timeText: '28s',
                      optionText: 'Correct Option: A',
                      optionColor: tertiary,
                      optionIcon: Icons.done_all,
                      actionBgColor: surfaceContainerLow,
                      actionTextColor: secondary,
                      actionText: 'Details',
                      actionIcon: Icons.chevron_right,
                    ),

                    _buildQuestionCard(
                      qNumber: 'Q.14',
                      qBgColor: const Color(0xFFFFDAD6),
                      qTextColor: const Color(0xFF93000A),
                      topic: 'Physics • Rotational Dynamics',
                      markText: '0.0',
                      markIcon: Icons.close,
                      markColor: const Color(0xFF93000A),
                      markBgColor: const Color(0xFFFFDAD6),
                      questionText:
                          'A rigid body of mass 2 kg moving along a circular path of radius 0.5 m with an angular velocity of 4 rad/s experiences a net torque...',
                      timeText: '1m 42s (High Pace)',
                      optionText: 'Your Pick: C • Correct: B',
                      optionColor: errorColor,
                      optionIcon: Icons.close,
                      actionBgColor: const Color(0xFFFFDAD6).withValues(alpha: 0.3),
                      actionTextColor: Colors.white,
                      actionText: 'View Solution',
                      actionIcon: Icons.chevron_right,
                      isError: true,
                    ),

                    _buildQuestionCard(
                      qNumber: 'Q.19',
                      qBgColor: surfaceContainer,
                      qTextColor: onSurface,
                      topic: 'Chemistry • Chemical Thermodynamics',
                      markText: 'Skipped',
                      markIcon: Icons.remove,
                      markColor: onSurfaceVariant,
                      markBgColor: const Color(0xFFE3E0FA),
                      questionText:
                          'For the isothermal reversible expansion of an ideal gas from volume V1 to V2, calculate the entropy change ΔS when temperature is maintained constant...',
                      timeText: '12s scan • High difficulty',
                      optionText: '',
                      optionColor: Colors.transparent,
                      optionIcon: Icons.info,
                      actionBgColor: surfaceContainerLow,
                      actionTextColor: secondary,
                      actionText: 'Practice Similar',
                      actionIcon: Icons.arrow_forward,
                    ),

                    // Coach card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFE9E5FF), Color(0xFFEFEBFF)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE6DEFF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.emoji_events,
                                size: 26, color: primary),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('COEP & VJTI Safe Zone',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: onSurface)),
                                SizedBox(height: 2),
                                Text(
                                    'At 98.4 percentile, your projected branch matches include Computer Engineering at top Maharashtra institutes!',
                                    style: TextStyle(
                                        fontSize: 12, color: onSurfaceVariant)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Actions
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.troubleshoot, size: 20),
                      label: const Text('Review Incorrect Questions (7 Qs)'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryContainer,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                         Navigator.pushNamed(context, AppRoutes.analytics);
                      },
                      icon: const Icon(Icons.picture_as_pdf, size: 20),
                      label: const Text('Download Detailed PDF Report'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: surfaceLowest,
                        foregroundColor: secondary,
                        minimumSize: const Size(double.infinity, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 1,
                      ),
                    ),
                    const SizedBox(height: 24),
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