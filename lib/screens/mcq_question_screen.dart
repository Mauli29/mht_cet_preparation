import 'package:flutter/material.dart';
import '../core/app_routes.dart';

class McqQuestionScreen extends StatefulWidget {
  const McqQuestionScreen({super.key});

  @override
  State<McqQuestionScreen> createState() => _McqQuestionScreenState();
}

class _McqQuestionScreenState extends State<McqQuestionScreen> {
  String? _selectedOption;
  bool _isMarkedForReview = false;
  bool _showHint = false;

  static const Color primary = Color(0xFF2E0093);
  static const Color primaryContainer = Color(0xFF4520B8);
  static const Color onSurface = Color(0xFF1A1A2C);
  static const Color onSurfaceVariant = Color(0xFF484554);
  static const Color surfaceContainer = Color(0xFFEFEBFF);
  static const Color surfaceContainerHigh = Color(0xFFE9E5FF);
  static const Color surfaceLowest = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFF004E36);

  Widget _buildOption({
    required String id,
    required String text,
  }) {
    final isSelected = _selectedOption == id;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = id;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? tertiaryContainer.withValues(alpha: 0.1)
              : surfaceLowest,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? const Color(0xFF4520B8).withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.03),
              blurRadius: isSelected ? 20 : 8,
              offset: isSelected ? const Offset(0, 6) : const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isSelected ? tertiaryContainer : surfaceContainerHigh,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                id,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                      color: onSurface,
                    ),
                  ),
                  if (isSelected) ...[
                    const SizedBox(height: 2),
                    const Text(
                      'Recorded selection',
                      style: TextStyle(
                        fontSize: 11,
                        color: tertiaryContainer,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected ? tertiaryContainer : const Color(0xFFC9C4D7),
              size: 24,
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
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EXAM DRILL',
                            style: TextStyle(
                              fontSize: 11,
                              color: onSurfaceVariant,
                              letterSpacing: 1.2,
                            ),
                          ),
                          Text(
                            'Q.1/20',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: onSurface,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
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
                          children: [
                            Icon(Icons.schedule, size: 18, color: primary),
                            SizedBox(width: 4),
                            Text(
                              '00:19:52',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calculate),
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
            // Progress Bar
            Container(
              height: 6,
              width: double.infinity,
              color: const Color(0xFFE3E0FA),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.05,
                child: Container(color: primaryContainer),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: surfaceContainerHigh,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Physics • Units & Measurements',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: surfaceContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                '+1.0 • -0.0',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: onSurfaceVariant,
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.questionPalette);
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.grid_view, size: 18, color: primary),
                              SizedBox(width: 4),
                              Text(
                                '1/20',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 11,
                              color: onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(text: 'Question 01 '),
                              TextSpan(
                                text: 'of 20',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          'Single Choice MCQ',
                          style: TextStyle(
                            fontSize: 11,
                            color: onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: surfaceLowest,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF4520B8).withValues(alpha: 0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'The acceleration due to gravity on the Earth is:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: onSurface,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Standard gravitational acceleration at sea level (Formula: g = GM / R²)',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.volume_up),
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                  foregroundColor: onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF6F2FF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.science, size: 18, color: primary),
                                SizedBox(width: 8),
                                Text(
                                  'Standard constant value in SI Metric units (m · s⁻²)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildOption(id: 'A', text: '9.8 m/s²'),
                    _buildOption(id: 'B', text: '8.9 m/s²'),
                    _buildOption(id: 'C', text: '10.8 m/s²'),
                    _buildOption(id: 'D', text: '11.8 m/s²'),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _isMarkedForReview = !_isMarkedForReview;
                            });
                          },
                          icon: Icon(
                            _isMarkedForReview
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            size: 18,
                            color: _isMarkedForReview
                                ? const Color(0xFF004E36)
                                : const Color(0xFF5E3ED5),
                          ),
                          label: Text(
                            _isMarkedForReview
                                ? 'Marked for Review'
                                : 'Mark for Review',
                            style: TextStyle(
                              color: _isMarkedForReview
                                  ? const Color(0xFF004E36)
                                  : onSurface,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: _isMarkedForReview
                                ? const Color(0xFF32C794).withValues(alpha: 0.2)
                                : surfaceContainer,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _showHint = !_showHint;
                            });
                          },
                          icon: const Icon(Icons.lightbulb, size: 18),
                          label: const Text('Formula Hint'),
                          style: TextButton.styleFrom(
                            foregroundColor: primary,
                          ),
                        ),
                      ],
                    ),
                    if (_showHint) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6F2FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.tips_and_updates,
                                        size: 18, color: primary),
                                    SizedBox(width: 6),
                                    Text(
                                      'Derivation Quick View',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: primary,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showHint = false;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    size: 16,
                                    color: onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: onSurfaceVariant,
                                ),
                                children: [
                                  TextSpan(text: 'Substitute Earth\'s Mass '),
                                  TextSpan(
                                    text: 'M ≈ 5.972 × 10²⁴ kg',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: onSurface,
                                    ),
                                  ),
                                  TextSpan(text: ' and Radius '),
                                  TextSpan(
                                    text: 'R ≈ 6.371 × 10⁶ m',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: onSurface,
                                    ),
                                  ),
                                  TextSpan(
                                      text: ' with gravitational constant '),
                                  TextSpan(
                                    text: 'G = 6.674 × 10⁻¹¹ N·m²/kg².',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFFFCF8FF),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                      onPressed: null, // Disabled as it's the first question
                      icon: const Icon(Icons.chevron_left),
                      label: const Text('Previous'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: surfaceContainerHigh,
                        foregroundColor: onSurfaceVariant.withValues(alpha: 0.5),
                        minimumSize: const Size(0, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.solutionExplanation);
                      },
                      icon: const Text('Save & Next'),
                      label: const Icon(Icons.arrow_forward),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryContainer,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
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