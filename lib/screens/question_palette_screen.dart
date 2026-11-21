import 'package:flutter/material.dart';
import '../core/app_routes.dart';

class QuestionPaletteScreen extends StatefulWidget {
  const QuestionPaletteScreen({super.key});

  @override
  State<QuestionPaletteScreen> createState() => _QuestionPaletteScreenState();
}

class _QuestionPaletteScreenState extends State<QuestionPaletteScreen> {
  static const Color primary = Color(0xFF2E0093);
  static const Color primaryContainer = Color(0xFF4520B8);
  static const Color onSurface = Color(0xFF1A1A2C);
  static const Color onSurfaceVariant = Color(0xFF484554);
  static const Color surfaceContainer = Color(0xFFEFEBFF);
  static const Color surfaceContainerHigh = Color(0xFFE9E5FF);
  static const Color surfaceLowest = Color(0xFFFFFFFF);

  static const Color answeredColor = Color(0xFF12B886);
  static const Color reviewColor = Color(0xFFF5A623);
  static const Color notAnsweredColor = Color(0xFFE5484D);

  Widget _buildLegendItem(Color color, String text, [IconData? icon]) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: icon != null
              ? Icon(icon, size: 10, color: Colors.white)
              : null,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionButton({
    required int number,
    required Color bgColor,
    required Color textColor,
    bool isActive = false,
    IconData? icon,
  }) {
    return Stack(
      children: [
        Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: isActive ? Border.all(color: primaryContainer, width: 2) : null,
            boxShadow: isActive || bgColor != surfaceContainer
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
        if (icon != null)
          Positioned(
            top: 4,
            right: 4,
            child: Icon(
              icon,
              size: 12,
              color: Colors.white,
            ),
          ),
        if (isActive)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Color(0xFFE6DEFF),
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xFF775AEF),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Mock Test #04 • Full Syllabus',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFDAD6),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.timer, size: 16, color: Color(0xFFBA1A1A)),
                        SizedBox(width: 6),
                        Text(
                          '01:59:45',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFBA1A1A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Subject Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'Physics',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '50 Qs',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'Chemistry',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: onSurfaceVariant,
                            ),
                          ),
                          Text(
                            '50 Qs',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF797586),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'Mathematics',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: onSurfaceVariant,
                            ),
                          ),
                          Text(
                            '50 Qs',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF797586),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Status Legend
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Question Palette',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: onSurface,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: surfaceContainerHigh,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'Physics Section 1',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            childAspectRatio: 5,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              _buildLegendItem(answeredColor, 'Answered (12)', Icons.check),
                              _buildLegendItem(reviewColor, 'Review (3)', Icons.bookmark),
                              _buildLegendItem(const Color(0xFFE3E0FA), 'Not Visited (5)'),
                              _buildLegendItem(notAnsweredColor, 'Not Answered (0)'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Number Grid
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
                              Text(
                                'QUESTIONS (1 - 20)',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: onSurfaceVariant,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              Text(
                                'Tap to jump',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          GridView.count(
                            crossAxisCount: 5,
                            shrinkWrap: true,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              _buildQuestionButton(
                                number: 1,
                                bgColor: primaryContainer,
                                textColor: Colors.white,
                                isActive: true,
                              ),
                              _buildQuestionButton(
                                number: 2,
                                bgColor: answeredColor,
                                textColor: Colors.white,
                              ),
                              _buildQuestionButton(
                                number: 3,
                                bgColor: answeredColor,
                                textColor: Colors.white,
                              ),
                              _buildQuestionButton(
                                number: 4,
                                bgColor: answeredColor,
                                textColor: Colors.white,
                              ),
                              _buildQuestionButton(
                                number: 5,
                                bgColor: reviewColor,
                                textColor: Colors.white,
                                icon: Icons.bookmark,
                              ),
                              _buildQuestionButton(
                                number: 6,
                                bgColor: answeredColor,
                                textColor: Colors.white,
                              ),
                              _buildQuestionButton(
                                number: 7,
                                bgColor: answeredColor,
                                textColor: Colors.white,
                              ),
                              _buildQuestionButton(
                                number: 8,
                                bgColor: reviewColor,
                                textColor: Colors.white,
                                icon: Icons.bookmark,
                              ),
                              _buildQuestionButton(
                                number: 9,
                                bgColor: answeredColor,
                                textColor: Colors.white,
                              ),
                              _buildQuestionButton(
                                number: 10,
                                bgColor: answeredColor,
                                textColor: Colors.white,
                              ),
                              _buildQuestionButton(
                                number: 11,
                                bgColor: answeredColor,
                                textColor: Colors.white,
                              ),
                              _buildQuestionButton(
                                number: 12,
                                bgColor: answeredColor,
                                textColor: Colors.white,
                              ),
                              _buildQuestionButton(
                                number: 13,
                                bgColor: reviewColor,
                                textColor: Colors.white,
                                icon: Icons.bookmark,
                              ),
                              _buildQuestionButton(
                                number: 14,
                                bgColor: answeredColor,
                                textColor: Colors.white,
                              ),
                              _buildQuestionButton(
                                number: 15,
                                bgColor: answeredColor,
                                textColor: Colors.white,
                              ),
                              _buildQuestionButton(
                                number: 16,
                                bgColor: surfaceContainer,
                                textColor: onSurfaceVariant,
                              ),
                              _buildQuestionButton(
                                number: 17,
                                bgColor: surfaceContainer,
                                textColor: onSurfaceVariant,
                              ),
                              _buildQuestionButton(
                                number: 18,
                                bgColor: surfaceContainer,
                                textColor: onSurfaceVariant,
                              ),
                              _buildQuestionButton(
                                number: 19,
                                bgColor: surfaceContainer,
                                textColor: onSurfaceVariant,
                              ),
                              _buildQuestionButton(
                                number: 20,
                                bgColor: surfaceContainer,
                                textColor: onSurfaceVariant,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Progress Summary
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
                              Text(
                                'Physics Progress',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: onSurface,
                                ),
                              ),
                              Text(
                                '30% Solved',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF5E3ED5),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 10,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: surfaceContainerHigh,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 24,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: answeredColor,
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    color: reviewColor,
                                  ),
                                ),
                                Expanded(
                                  flex: 70,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: surfaceContainer,
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF6F2FF),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Column(
                                    children: [
                                      Text(
                                        'Total Qs',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xFF797586),
                                        ),
                                      ),
                                      Text(
                                        '50',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: onSurface,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF6F2FF),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Column(
                                    children: [
                                      Text(
                                        'Attempted',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xFF797586),
                                        ),
                                      ),
                                      Text(
                                        '12',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: answeredColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF6F2FF),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Column(
                                    children: [
                                      Text(
                                        'Remaining',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xFF797586),
                                        ),
                                      ),
                                      Text(
                                        '38',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Actions
                    ElevatedButton.icon(
                      onPressed: () {
                        // Show Submit Dialog
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Submit Examination?'),
                            content: const Text('You have 38 unanswered questions. Are you sure you want to finish the test?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Continue Test'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, AppRoutes.testResults);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryContainer,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Yes, Submit'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.assignment_turned_in),
                      label: const Text('Submit Test'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryContainer,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.play_circle),
                      label: const Text('Resume Test'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: surfaceLowest,
                        foregroundColor: primary,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
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