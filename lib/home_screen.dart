import 'package:flutter/material.dart';

import 'screens/subject_selection_screen.dart';
import 'screens/cbt_live_screen.dart';
import 'screens/test_results_screen.dart';

const Color primary = Color(0xFF2E0093);
const Color primaryContainer = Color(0xFF4520B8);
const Color secondary = Color(0xFF5E3ED5);
const Color background = Color(0xFFFCF8FF);
const Color surfaceLow = Color(0xFFF6F2FF);
const Color surfaceHigh = Color(0xFFE9E5FF);
const Color surfaceContainer = Color(0xFFEFEBFF);
const Color onSurface = Color(0xFF1A1A2C);
const Color muted = Color(0xFF484554);
const Color outline = Color(0xFF797586);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  static const _moduleTabs = <String, int>{
    'Notes': 1,
    'MCQ Practice': 1,
    'Mock Test': 2,
    'PYQ Papers': 2,
    'Leaderboard': 3,
  };

  void _selectTab(int index) {
    setState(() => selectedIndex = index);
  }

  void _openModule(String moduleName) {
    if (moduleName == 'Daily Streak') {
      Navigator.pushNamed(context, '/analytics');
      return;
    }

    final tabIndex = _moduleTabs[moduleName];
    if (tabIndex == null) {
      showMessage('$moduleName is not available yet.');
      return;
    }

    _selectTab(tabIndex);
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        bottom: false,
        child: IndexedStack(
          index: selectedIndex,
          children: [
            _buildHome(),
            const SubjectSelectionScreen(),
            const CbtLiveScreen(),
            const TestResultsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget _buildHome() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 95),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const SizedBox(height: 18),
          _heroCard(),
          const SizedBox(height: 22),
          _quickAccess(),
          const SizedBox(height: 22),
          _progressSection(),
          const SizedBox(height: 22),
          _topRankers(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // HEADER

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Row(
        children: [
          IconButton(
            onPressed: () => showMessage('Menu opened'),
            icon: const Icon(Icons.menu, size: 26),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Hello, Akshay!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: onSurface,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text('👋', style: TextStyle(fontSize: 20)),
                  ],
                ),
                const Text(
                  "Let's crack MHT CET together!",
                  style: TextStyle(fontSize: 12, color: muted),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () => showMessage('Notifications'),
                icon: const Icon(Icons.notifications_none, size: 25),
              ),
              Positioned(
                top: 9,
                right: 10,
                child: Container(
                  height: 9,
                  width: 9,
                  decoration: const BoxDecoration(
                    color: Color(0xFFBA1A1A),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            tooltip: 'Profile',
            onPressed: () => Navigator.pushNamed(context, '/profile'),
            icon: const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuANSuWRZarFtYh3BSzgsVvVNavoLQgzmLxl66QE6gqEBIufXj5gcIsC8ZEcjlR8XfxjYT3NhsX_aBYGo36cc1C87FyJZIzFET3EFAIrY2qlaCSKqYLBX2FfQnk7sLIfOtDvMwnQyVUpOfXHhvlD94SIJK75AaP3bnop4ce_lWllzCJkRKBzEWwEQedGEblJu9_Xs1LrvW_pkPb12S5ZWQFAXisUpc2Kucfaq9yZFM0',
              ),
            ),
          ),
        ],
      ),
    );
  }

  // HERO CARD

  Widget _heroCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 205,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [primary, primaryContainer, Color(0xFF775AEF)],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -25,
              top: -35,
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.bolt,
                                size: 14,
                                color: Color(0xFFE6DEFF),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Target 2025',
                                style: TextStyle(
                                  color: Color(0xFFE6DEFF),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Score Higher',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'in MHT CET',
                          style: TextStyle(
                            color: Color(0xFFE6DEFF),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Personalized mocks & shortcuts',
                          style: TextStyle(
                            color: Color(0xFFB4A5FF),
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 34,
                          child: ElevatedButton(
                            onPressed: () => _selectTab(1),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: primary,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Prepare Smart!',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_forward, size: 14),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuCA5BPfyJPeCg_cCLrRCQADX61hKZzACwrqDmIYV32qfdpipG7WQCQBQCR5-nYfc-dR3Y1qyf0nN51hsNFrvp6ZOs59C0z6dDaAxgdglQ-IAM1JKf240c6H5golbHgkTsmo8zC3y-fIC8xce7Z8uo9Sx1GzPcZ0m80ggDmv0kO1w-LKEIW4mapDbVwOjqlncOu8X5GWOPII64J-QfXvA-tnRlfzR-V0jnYvOrh-uYY',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.menu_book,
                        color: Colors.white,
                        size: 80,
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

  // QUICK ACCESS

  Widget _quickAccess() {
    final modules = [
      {
        'name': 'Notes',
        'icon': Icons.description,
        'color': Colors.blue,
        'bg': const Color(0xFFEAF5FF),
      },
      {
        'name': 'MCQ Practice',
        'icon': Icons.checklist_rtl,
        'color': Colors.green,
        'bg': const Color(0xFFE9F8EF),
      },
      {
        'name': 'Mock Test',
        'icon': Icons.devices,
        'color': secondary,
        'bg': const Color(0xFFF1EDFF),
      },
      {
        'name': 'PYQ Papers',
        'icon': Icons.history_edu,
        'color': Colors.indigo,
        'bg': const Color(0xFFEEF0FF),
      },
      {
        'name': 'Leaderboard',
        'icon': Icons.emoji_events,
        'color': Colors.orange,
        'bg': const Color(0xFFFFF5E5),
      },
      {
        'name': 'Daily Streak',
        'icon': Icons.local_fire_department,
        'color': Colors.red,
        'bg': const Color(0xFFFFEEEE),
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Quick Access',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: onSurface,
                ),
              ),
              Text(
                '6 Modules',
                style: TextStyle(
                  color: secondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: modules.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.05,
            ),
            itemBuilder: (context, index) {
              final item = modules[index];

              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => _openModule(item['name'] as String),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x10000000),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: item['bg'] as Color,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          item['icon'] as IconData,
                          color: item['color'] as Color,
                          size: 26,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          item['name'] as String,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: onSurface,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // PROGRESS SECTION

  Widget _progressSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Your Progress',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: onSurface,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: surfaceHigh,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Class 12',
                      style: TextStyle(
                        color: primary,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/analytics'),
                child: const Text(
                  'View All  ›',
                  style: TextStyle(
                    color: secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x10000000),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 65,
                  width: 65,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 65,
                        width: 65,
                        child: CircularProgressIndicator(
                          value: 0.65,
                          strokeWidth: 4,
                          backgroundColor: const Color(0xFFE3E0FA),
                          valueColor: const AlwaysStoppedAnimation(
                            Color(0xFF004E36),
                          ),
                        ),
                      ),
                      const Text(
                        '65%',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Syllabus Covered',
                        style: TextStyle(
                          color: onSurface,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '156 / 240 Topics',
                        style: TextStyle(color: muted, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                _weeklyChart(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _weeklyChart() {
    final heights = [20.0, 32.0, 40.0, 16.0, 48.0, 28.0, 36.0];
    final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return SizedBox(
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(7, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: heights[index],
                  width: 6,
                  decoration: BoxDecoration(
                    color: index == 4
                        ? primaryContainer
                        : index == 6
                        ? const Color(0xFF004E36)
                        : secondary.withValues(alpha: 0.75),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  days[index],
                  style: const TextStyle(fontSize: 9, color: outline),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // TOP RANKERS

  Widget _topRankers() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.emoji_events, color: Colors.amber, size: 22),
              const SizedBox(width: 7),
              const Expanded(
                child: Text(
                  'Top 3 Rankers',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: onSurface,
                  ),
                ),
              ),
              const Text(
                'PCM Mock #14',
                style: TextStyle(fontSize: 10, color: muted),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x10000000),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: _ranker(
                    name: 'Sneha',
                    percentage: '97.8%',
                    rank: '2',
                    height: 48,
                    color: const Color(0xFFB0B8C5),
                    image:
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDZbZmiCXjhU7uohbB8Ir08ZsQkywdvLqRX4olYUmgW4TpMYj7Pczc7xhJjTNPgTsO7JDp-LYPkepiooKrzu-MHsQ4dkf7EF5Sg3elqvAjLhMnp7gstpoDxhXOtyosgJ7AlseG1UUJNFmBHqtpSSEzA3JJhMXqybOM6i5xm2AozCeFJVF_bXV4wjc1z_wDW5ShZskHw9VbsvLg0ILvPG7rKcQWPGyZNuL2z5u9xEU8',
                  ),
                ),
                Expanded(
                  child: _ranker(
                    name: 'Rahul',
                    percentage: '98.5%',
                    rank: '1',
                    height: 64,
                    color: Colors.amber,
                    image:
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCODzPFiuzdcCc506gPrJMJuuyTevXI-T9BY0Iu9-EHsIsFyA4k5S2ok9DBBuGxlhC8-eZsds7CRI0PirpLAoEZLKlt3aV5996XVaVQDRtc1aQGhLsmYKHTYeNL_dFfbTHFkRLYD6nV0njN3oFjd8Ctaj0FpcG7b9MPtQ_8DLHjsPYjcwB4PmziOthPxeGGP9qhMgurvfmr5J_ZMH25WNZWjpgSkKxLrfV66eAWN4U',
                  ),
                ),
                Expanded(
                  child: _ranker(
                    name: 'Amit',
                    percentage: '96.9%',
                    rank: '3',
                    height: 40,
                    color: const Color(0xFFB77946),
                    image:
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDoAkuaIwyo8c3e67r0FkQDboUu7RqYyobPGZGzNVgUkoY15XvsZcjJx8jCqhEP8nEmoe1AgYJjy7EBAxM90B3NrMnYADxTBRf1lcisersoSJ0aUJL2nkyTp-DJRHbzzet2cUiJoMtXuCawbv8WUyExVymX1bOP-NcgE8Yx00BlohGce7Q_xgMQiqz80nM3DIX-IqXI7AIXl8bh6xwgk6_5ts0zwnksCk5prDvC7Po',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _ranker({
    required String name,
    required String percentage,
    required String rank,
    required double height,
    required Color color,
    required String image,
  }) {
    final isFirst = rank == '1';

    return Column(
      children: [
        if (isFirst)
          const Icon(Icons.workspace_premium, color: Colors.amber, size: 23)
        else
          const SizedBox(height: 23),
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: isFirst ? 28 : 24,
              backgroundColor: color,
              backgroundImage: NetworkImage(image),
            ),
            Positioned(
              bottom: -3,
              right: -3,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: color,
                child: Text(
                  rank,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Text(
          name,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: onSurface,
          ),
        ),
        Text(
          percentage,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: secondary,
          ),
        ),
        const SizedBox(height: 7),
        Container(
          height: height,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isFirst ? surfaceHigh : surfaceLow,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              rank == '1'
                  ? '1st'
                  : rank == '2'
                  ? '2nd'
                  : '3rd',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isFirst ? primary : outline,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // BOTTOM NAVIGATION

  Widget _bottomNavigation() {
    final items = [
      {'icon': Icons.home, 'label': 'Home'},
      {'icon': Icons.menu_book, 'label': 'Practice'},
      {'icon': Icons.assignment, 'label': 'Test'},
      {'icon': Icons.leaderboard, 'label': 'Ranks'},
      {'icon': Icons.person, 'label': 'Profile'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: background.withValues(alpha: 0.98),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final isSelected = selectedIndex == index;

              return InkWell(
                onTap: () {
                  if (index == 4) {
                    Navigator.pushNamed(context, '/profile');
                  } else {
                    _selectTab(index);
                  }
                },
                child: SizedBox(
                  width: 65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        items[index]['icon'] as IconData,
                        size: 23,
                        color: isSelected ? primary : muted,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        items[index]['label'] as String,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: isSelected ? primary : muted,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }


}

