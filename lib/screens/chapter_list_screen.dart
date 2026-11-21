import 'package:flutter/material.dart';
import '../core/app_routes.dart';

class ChapterListScreen extends StatefulWidget {
  const ChapterListScreen({super.key});

  @override
  State<ChapterListScreen> createState() => _ChapterListScreenState();
}

class _ChapterListScreenState extends State<ChapterListScreen> {
  String _activeClass = '12';

  static const Color primary = Color(0xFF4520B8);
  static const Color onSurface = Color(0xFF1A1A2C);
  static const Color onSurfaceVariant = Color(0xFF484554);
  static const Color surfaceContainer = Color(0xFFEFEBFF);
  static const Color surfaceContainerHigh = Color(0xFFE9E5FF);
  static const Color surfaceLowest = Color(0xFFFFFFFF);

  Widget _buildChapterCard({
    required String number,
    required String title,
    required String marks,
    required String difficulty,
    required String stats,
    required String progress,
    required double progressValue,
    required Color progressColor,
    required IconData statusIcon,
    required String statusText,
    required Color statusColor,
    required Color numberBgColor,
    required Color numberTextColor,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.chapterDetails);
      },
      child: Container(
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
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: numberBgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    number,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: numberTextColor,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Chapter ${int.parse(number)}',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: primary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: surfaceContainerHigh,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              marks,
                              style: const TextStyle(
                                fontSize: 11,
                                color: primary, // Changed to match reference
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFF70FBC4,
                              ), // High weightage color
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              difficulty,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF002115),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: surfaceContainer,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chevron_right,
                    size: 18,
                    color: onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                            color: surfaceContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: progressValue,
                            child: Container(
                              decoration: BoxDecoration(
                                color: progressColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        progress,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: progressColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Row(
                  children: [
                    Icon(statusIcon, size: 14, color: statusColor),
                    const SizedBox(width: 4),
                    Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ],
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
                              backgroundColor: surfaceContainer,
                              foregroundColor: primary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'MHT CET PREPARATION',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: onSurfaceVariant,
                                ),
                              ),
                              Text(
                                'Physics Chapters',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: onSurface,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.tune),
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: surfaceContainer,
                          foregroundColor: onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: surfaceContainer,
                      borderRadius: BorderRadius.circular(12),
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
                                color: primary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.science,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Physics',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: onSurface,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF70FBC4),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                        ),
                                        child: Text(
                                          '18/28 Done',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF002115),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'CET Target: 45+ / 50 Marks',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '64%',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: primary,
                                  ),
                                ),
                                Text(
                                  'Syllabus Mastered',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 8,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.64,
                            child: Container(
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF004E36),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  '18 Completed',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF5E3ED5),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  '4 In Progress',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFC9C4D7),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  '6 Remaining',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      children: [
                        const Icon(
                          Icons.search,
                          color: Color(0xFF797586),
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search chapter, topic or formula...',
                              hintStyle: const TextStyle(
                                color: Color(0xFF797586),
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.mic,
                          color: Color(0xFF797586),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _activeClass = '12';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: _activeClass == '12'
                                    ? primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Class 12',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: _activeClass == '12'
                                          ? Colors.white
                                          : onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _activeClass == '12'
                                          ? Colors.white.withValues(alpha: 0.2)
                                          : const Color(0xFFE3E0FA),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      '80% CET',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: _activeClass == '12'
                                            ? Colors.white
                                            : onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _activeClass = '11';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: _activeClass == '11'
                                    ? primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Class 11',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: _activeClass == '11'
                                          ? Colors.white
                                          : onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _activeClass == '11'
                                          ? Colors.white.withValues(alpha: 0.2)
                                          : const Color(0xFFE3E0FA),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      '20% CET',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: _activeClass == '11'
                                            ? Colors.white
                                            : onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                  _buildChapterCard(
                    number: '01',
                    title: 'Rotational Dynamics',
                    marks: '7 Marks',
                    difficulty: 'High Weightage',
                    stats: '140 MCQs • 45 PYQs (2018–2024)',
                    progress: '85%',
                    progressValue: 0.85,
                    progressColor: primary,
                    statusIcon: Icons.check_circle,
                    statusText: 'Proficient',
                    statusColor: const Color(0xFF32C794),
                    numberBgColor: const Color(0xFFE6DEFF),
                    numberTextColor: primary,
                  ),
                  _buildChapterCard(
                    number: '02',
                    title: 'Mechanical Properties of Fluids',
                    marks: '5 Marks',
                    difficulty: 'Medium Difficulty',
                    stats: '120 MCQs • 38 PYQs',
                    progress: '60%',
                    progressValue: 0.60,
                    progressColor: const Color(0xFF5E3ED5),
                    statusIcon: Icons.timelapse,
                    statusText: 'In Progress',
                    statusColor: const Color(0xFF5E3ED5),
                    numberBgColor: surfaceContainer,
                    numberTextColor: onSurface,
                  ),
                  _buildChapterCard(
                    number: '03',
                    title: 'Kinetic Theory & Radiation',
                    marks: '5 Marks',
                    difficulty: 'Moderate',
                    stats: '110 MCQs • 32 PYQs',
                    progress: '40%',
                    progressValue: 0.40,
                    progressColor: const Color(0xFF5E3ED5),
                    statusIcon: Icons.timelapse,
                    statusText: 'In Progress',
                    statusColor: const Color(0xFF5E3ED5),
                    numberBgColor: surfaceContainer,
                    numberTextColor: onSurface,
                  ),
                  _buildChapterCard(
                    number: '04',
                    title: 'Thermodynamics',
                    marks: '6 Marks',
                    difficulty: 'High Weightage',
                    stats: '135 MCQs • 40 PYQs',
                    progress: '90%',
                    progressValue: 0.90,
                    progressColor: primary,
                    statusIcon: Icons.check_circle,
                    statusText: 'Mastered',
                    statusColor: const Color(0xFF32C794),
                    numberBgColor: const Color(0xFFE6DEFF),
                    numberTextColor: primary,
                  ),
                  _buildChapterCard(
                    number: '05',
                    title: 'Oscillations',
                    marks: '5 Marks',
                    difficulty: 'Medium',
                    stats: '95 MCQs • 28 PYQs',
                    progress: '0%',
                    progressValue: 0.0,
                    progressColor: const Color(0xFF797586),
                    statusIcon: Icons.radio_button_unchecked,
                    statusText: 'Not Started',
                    statusColor: const Color(0xFF797586),
                    numberBgColor: surfaceContainer,
                    numberTextColor: const Color(0xFF797586),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.cbtLive);
          },
          icon: const Icon(Icons.play_arrow),
          label: const Text('Start Practice'),
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
