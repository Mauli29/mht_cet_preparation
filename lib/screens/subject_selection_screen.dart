import 'package:flutter/material.dart';
import '../core/app_routes.dart';

class SubjectSelectionScreen extends StatefulWidget {
  const SubjectSelectionScreen({super.key});

  @override
  State<SubjectSelectionScreen> createState() => _SubjectSelectionScreenState();
}

class _SubjectSelectionScreenState extends State<SubjectSelectionScreen> {
  String _activeFilter = 'all';

  static const Color primary = Color(0xFF4520B8);
  static const Color onSurface = Color(0xFF1A1A2C);
  static const Color onSurfaceVariant = Color(0xFF484554);
  static const Color surfaceContainerLow = Color(0xFFF6F2FF);
  static const Color surfaceContainerHigh = Color(0xFFE9E5FF);

  Widget _buildFilterChip({
    required String id,
    required String label,
    required IconData icon,
  }) {
    final isActive = _activeFilter == id;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _activeFilter = id;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: isActive ? primary : surfaceContainerLow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: isActive ? Colors.white : onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isActive ? Colors.white : onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectCard({
    required String title,
    required String badgeText,
    required String stats,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String progress,
    required double progressValue,
    required String progressText1,
    required String progressText2,
    required String topicIcon,
    required IconData tIcon,
    required String topicText,
    required String category,
  }) {
    if (_activeFilter != 'all' && _activeFilter != category) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.chapterList);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: iconColor, size: 26),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: onSurface,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: iconColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              badgeText,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: iconColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        stats,
                        style: const TextStyle(
                          fontSize: 12,
                          color: onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      progress,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: iconColor,
                      ),
                    ),
                    const Text(
                      'Done',
                      style: TextStyle(fontSize: 11, color: onSurfaceVariant),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: surfaceContainerHigh,
                borderRadius: BorderRadius.circular(4),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progressValue,
                child: Container(
                  decoration: BoxDecoration(
                    color: iconColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  progressText1,
                  style: const TextStyle(fontSize: 11, color: onSurfaceVariant),
                ),
                Text(
                  progressText2,
                  style: const TextStyle(fontSize: 11, color: onSurfaceVariant),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: surfaceContainerLow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(tIcon, size: 16, color: iconColor),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            topicText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Practice',
                        style: TextStyle(
                          fontSize: 11,
                          color: primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.chevron_right, size: 16, color: primary),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Navigator.pop(context),
                            style: IconButton.styleFrom(
                              backgroundColor: surfaceContainerLow,
                              foregroundColor: primary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Subject Selection',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: onSurface,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.school, size: 16, color: primary),
                            SizedBox(width: 4),
                            Text(
                              'PCM (Class 12)',
                              style: TextStyle(
                                fontSize: 11,
                                color: primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Choose a subject to practice chapter-wise MCQs, PYQs, and high-yield question sets.',
                    style: TextStyle(
                      fontSize: 12,
                      color: onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip(
                          id: 'all',
                          label: 'All Subjects',
                          icon: Icons.apps,
                        ),
                        _buildFilterChip(
                          id: 'practiced',
                          label: 'Most Practiced',
                          icon: Icons.trending_up,
                        ),
                        _buildFilterChip(
                          id: 'weak',
                          label: 'Weak Areas',
                          icon: Icons.track_changes,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildSubjectCard(
                    category: 'practiced',
                    title: 'Physics',
                    badgeText: 'Core',
                    stats: '28 Chapters • 1,420 MCQs',
                    icon: Icons.all_inclusive,
                    iconColor: primary,
                    iconBgColor: surfaceContainerHigh,
                    progress: '64%',
                    progressValue: 0.64,
                    progressText1: '18 / 28 Chapters completed',
                    progressText2: '450 PYQs ready',
                    topicIcon: 'bolt',
                    tIcon: Icons.bolt,
                    topicText: 'Rotational Dynamics • Thermodynamics',
                  ),
                  _buildSubjectCard(
                    category: 'practiced',
                    title: 'Chemistry',
                    badgeText: 'Top Scorer',
                    stats: '32 Chapters • 1,600 MCQs',
                    icon: Icons.science,
                    iconColor: const Color(0xFF004E36),
                    iconBgColor: const Color(0xFF70FBC4).withValues(alpha: 0.3),
                    progress: '68%',
                    progressValue: 0.68,
                    progressText1: '22 / 32 Chapters completed',
                    progressText2: '520 PYQs ready',
                    topicIcon: 'experiment',
                    tIcon: Icons.science_outlined,
                    topicText: 'Chemical Thermodynamics • Coordination',
                  ),
                  _buildSubjectCard(
                    category: 'weak',
                    title: 'Mathematics',
                    badgeText: 'Weightage: 100M',
                    stats: '20 Chapters • 1,200 MCQs',
                    icon: Icons.calculate,
                    iconColor: const Color(0xFF5E3ED5),
                    iconBgColor: const Color(0xFFE3E0FA),
                    progress: '60%',
                    progressValue: 0.60,
                    progressText1: '12 / 20 Chapters completed',
                    progressText2: '380 PYQs ready',
                    topicIcon: 'functions',
                    tIcon: Icons.functions,
                    topicText: 'Calculus • Vectors • 3D Geometry',
                  ),
                  if (_activeFilter == 'all')
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: surfaceContainerLow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: surfaceContainerHigh,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.eco,
                                      color: onSurfaceVariant,
                                      size: 26,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Biology',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: onSurface,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE3E0FA),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Text(
                                              'PCB / Pharmacy',
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: onSurfaceVariant,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      const Text(
                                        '34 Chapters • 1,850 MCQs available',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE3E0FA),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Switch Stream',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: primary,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.swap_horiz,
                                      size: 16,
                                      color: primary,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.info, size: 16, color: primary),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Looking for Pharmacy or Agriculture? Switch to PCB or PCMB anytime.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: onSurfaceVariant,
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
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
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
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.local_fire_department,
                                    size: 14,
                                    color: Color(0xFFCABEFF),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Timed Sprint',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFFCABEFF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              '25 High-Yield MCQs',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFFB4A5FF),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Daily Rapid Fire Challenge',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Test your recall across Physics, Chemistry & Maths in a balanced mock round under 20 minutes.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFB4A5FF),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.cbtLive);
                              },
                              icon: const Icon(Icons.play_arrow, size: 18),
                              label: const Text('Start Marathon'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              '+50 Rank XP',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFFB4A5FF),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80), // Padding for bottom nav
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}