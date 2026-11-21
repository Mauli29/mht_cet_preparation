import 'package:flutter/material.dart';
import '../core/app_routes.dart';

class SelectExamGroupScreen extends StatefulWidget {
  const SelectExamGroupScreen({super.key});

  @override
  State<SelectExamGroupScreen> createState() => _SelectExamGroupScreenState();
}

class _SelectExamGroupScreenState extends State<SelectExamGroupScreen> {
  String _selectedGroup = 'pcb';

  static const Color primary = Color(0xFF4520B8);
  static const Color surfaceContainer = Color(0xFFEFEBFF);
  static const Color surfaceLowest = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF1A1A2C);
  static const Color onSurfaceVariant = Color(0xFF484554);

  Widget _buildGroupCard({
    required String id,
    required String title,
    required String badgeText,
    required String description,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    final isSelected = _selectedGroup == id;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGroup = id;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? surfaceContainer : surfaceLowest,
          borderRadius: BorderRadius.circular(12),
          border: isSelected ? Border.all(color: primary, width: 2) : null,
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
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
            const SizedBox(width: 14),
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
                          color: isSelected
                              ? const Color(0xFFE6DEFF)
                              : const Color(0xFFE9E5FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          badgeText,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                            color: isSelected
                                ? const Color(0xFF1C0062)
                                : onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? onSurface : onSurfaceVariant,
                      fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isSelected ? primary : surfaceContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSelected ? Icons.check : Icons.chevron_right,
                color: isSelected ? Colors.white : onSurfaceVariant,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String dynamicHeading = '';
    String dynamicDesc = '';

    switch (_selectedGroup) {
      case 'pcm':
        dynamicHeading = 'PCM Stream for B.Tech & Engineering Aspirants';
        dynamicDesc =
            '150 questions (50 Physics, 50 Chemistry, 50 Mathematics). High-speed numerical drills and differential calculus emphasis.';
        break;
      case 'pcb':
        dynamicHeading = 'PCB Stream Recommended for B.Pharm & Allied';
        dynamicDesc =
            '150 questions (50 Physics, 50 Chemistry, 100 Biology marks) calibrated to State Board syllabus weighting.';
        break;
      case 'pcmb':
        dynamicHeading = 'PCMB Dual Track: Maximum Flexibility';
        dynamicDesc =
            'Simultaneous ranking coverage for B.Tech, B.Sc Agriculture, and Pharmacy competitive admission pools.';
        break;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFCF8FF),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                          style: IconButton.styleFrom(
                            backgroundColor: surfaceContainer,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6DEFF),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.school, size: 14, color: Color(0xFF4821BF)),
                              SizedBox(width: 6),
                              Text(
                                'MHT CET 2025',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF4821BF),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.help_outline),
                          onPressed: () {},
                          style: IconButton.styleFrom(
                            backgroundColor: surfaceContainer,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text(
                          'Select Your Group',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: onSurface,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFF2E0093),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Choose your exam group to personalize daily mock drills, weightage breakdowns, and question banks.',
                      style: TextStyle(
                        fontSize: 14,
                        color: onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF4520B8),
                            Color(0xFF5E3ED5),
                            Color(0xFF4520B8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.bolt,
                                      color: Color(0xFFB4A5FF),
                                      size: 14,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'HIGH PRECISION MATRIX',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFB4A5FF),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Tailored syllabus mapping',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Switch anytime before syllabus lock',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: const Color(0xFFE9E5FF).withValues(
                                      alpha: 0.9,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.hub,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        _buildGroupCard(
                          id: 'pcm',
                          title: 'PCM',
                          badgeText: 'Engineering',
                          description: 'Physics • Chemistry • Mathematics',
                          icon: Icons.science,
                          iconColor: const Color(0xFF2563EB),
                          iconBgColor: const Color(0xFF2563EB).withValues(
                            alpha: 0.1,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _buildGroupCard(
                          id: 'pcb',
                          title: 'PCB',
                          badgeText: 'Pharmacy',
                          description: 'Physics • Chemistry • Biology',
                          icon: Icons.local_pharmacy,
                          iconColor: const Color(0xFF12B886),
                          iconBgColor: const Color(0xFF12B886).withValues(
                            alpha: 0.15,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _buildGroupCard(
                          id: 'pcmb',
                          title: 'PCMB',
                          badgeText: 'Dual Track',
                          description: 'Physics • Chemistry • Math • Bio',
                          icon: Icons.biotech,
                          iconColor: const Color(0xFF7C3AED),
                          iconBgColor: const Color(0xFF7C3AED).withValues(
                            alpha: 0.1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F2FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE9E5FF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.auto_awesome,
                              color: Color(0xFF5E3ED5),
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dynamicHeading,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: onSurface,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  dynamicDesc,
                                  style: const TextStyle(
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
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: surfaceLowest,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuBQzKfNHoFVPtLTdC95TrYQPJURU5_bxn2UfdNv4dG7q_cSmjWZgLpiJfa2uYVHZBb3jFvNFEJEbAuOVN8aQoaI6_ts8ZdpSh8mq6Eh7LNffGAupOMOpRxi6z0wvZ-pbKo93jLNWAuhVR0lN53PZI503Nhtk3D7E1pS9Z8a4GcWkv87tPQBWCQdu6erVb6B-OlqD7QoLFG5jtsM_iShsg3_x9vxRnCQdRqNfWrVUcU',
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Over 48,000+ MHT CET Aspirants',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: onSurface,
                                  ),
                                ),
                                Text(
                                  'Practicing timed mock exams daily on this matrix',
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
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFCF8FF),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.95),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: const Offset(0, -10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.subjectSelection);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue to Dashboard',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock, size: 14, color: onSurfaceVariant),
                      SizedBox(width: 6),
                      Text(
                        'Choice securely saved to your aspirant profile',
                        style: TextStyle(
                          fontSize: 11,
                          color: onSurfaceVariant,
                        ),
                      ),
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
}