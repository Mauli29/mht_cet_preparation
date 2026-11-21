import 'package:flutter/material.dart';

void main() {
  runApp(const AspirantPortalApp());
}

class AspirantPortalApp extends StatelessWidget {
  const AspirantPortalApp({super.key});

  static const Color primary = Color(0xFF2E0093);
  static const Color secondary = Color(0xFF5E3ED5);
  static const Color surface = Color(0xFFFCF8FF);
  static const Color onSurface = Color(0xFF1A1A2C);
  static const Color muted = Color(0xFF484554);
  static const Color container = Color(0xFFEFEBFF);
  static const Color containerHigh = Color(0xFFE9E5FF);
  static const Color outline = Color(0xFF797586);
  static const Color tertiary = Color(0xFF003524);
  static const Color error = Color(0xFFBA1A1A);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aspirant Portal',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: surface,
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: primary,
              brightness: Brightness.light,
            ).copyWith(
              primary: primary,
              secondary: secondary,
              surface: surface,
              onSurface: onSurface,
              error: error,
            ),
        fontFamily: 'Inter',
      ),
      home: const ProfileSettingsPage(),
    );
  }
}

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  int _selectedTab = 4;

  void _showSetting(String title, String detail) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: AspirantPortalApp.surface,
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              detail,
              style: const TextStyle(
                color: AspirantPortalApp.muted,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmLogout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log out?'),
        content: const Text(
          'Are you sure you want to log out of your MHT CET Preparation account? '
          'Your unsaved offline test progress will be synced.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Log out'),
          ),
        ],
      ),
    );

    if (shouldLogout == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You have been logged out.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _TopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _SubHeader(onBack: () => Navigator.maybePop(context)),
                    const SizedBox(height: 16),
                    const _ProfileCard(),
                    const SizedBox(height: 18),
                    _SettingsSection(
                      title: 'Preparation Preferences',
                      items: [
                        _SettingData(
                          icon: Icons.track_changes,
                          title: 'Daily Goal',
                          subtitle: 'Questions solved per session',
                          value: '50 Questions',
                          onTap: () => _showSetting(
                            'Daily Goal',
                            'Your current target is 50 questions per study session.',
                          ),
                        ),
                        _SettingData(
                          icon: Icons.notifications_none,
                          title: 'Notifications',
                          subtitle: 'Exam alerts & mock reminders',
                          value: 'On',
                          valueDot: true,
                          onTap: () => _showSetting(
                            'Notifications',
                            'Exam alerts and mock test reminders are turned on.',
                          ),
                        ),
                        _SettingData(
                          icon: Icons.timer_outlined,
                          title: 'Exam Simulation',
                          subtitle: 'Strict MHT CET NTA Timer mode',
                          value: 'Strict',
                          valueColor: AspirantPortalApp.tertiary,
                          onTap: () => _showSetting(
                            'Exam Simulation',
                            'Strict timer mode is enabled for exam simulations.',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _SettingsSection(
                      title: 'Display & Regional',
                      items: [
                        _SettingData(
                          icon: Icons.badge_outlined,
                          title: 'My Profile',
                          subtitle: 'Academic roll, target colleges',
                          onTap: () => _showSetting(
                            'My Profile',
                            'Manage your academic details and target colleges.',
                          ),
                        ),
                        _SettingData(
                          icon: Icons.light_mode_outlined,
                          title: 'Appearance',
                          subtitle: 'High-readability study theme',
                          value: 'Light Mode',
                          onTap: () => _showSetting(
                            'Appearance',
                            'The light study theme is currently selected.',
                          ),
                        ),
                        _SettingData(
                          icon: Icons.translate,
                          title: 'Language',
                          subtitle: 'Test questions & explanations',
                          value: 'English',
                          onTap: () => _showSetting(
                            'Language',
                            'English is currently selected for questions and explanations.',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _SettingsSection(
                      title: 'Support & Community',
                      items: [
                        _SettingData(
                          icon: Icons.info_outline,
                          title: 'About App',
                          subtitle: 'Version 4.2.1 • Syllabi Build 2026',
                          onTap: () => _showSetting(
                            'About App',
                            'MHT-CET Aspirant Portal\nVersion 4.2.1 • Syllabi Build 2026',
                          ),
                        ),
                        _SettingData(
                          icon: Icons.contact_support_outlined,
                          title: 'Help & Support',
                          subtitle: 'Question error reporting, doubts',
                          onTap: () => _showSetting(
                            'Help & Support',
                            'Get help with question errors, doubts, and your account.',
                          ),
                        ),
                        _SettingData(
                          icon: Icons.policy_outlined,
                          title: 'Honor Code & Privacy',
                          subtitle: 'Zero-tolerance test authenticity policy',
                          onTap: () => _showSetting(
                            'Honor Code & Privacy',
                            'Review the test authenticity policy and privacy information.',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _LogoutTile(onTap: _confirmLogout),
                    const SizedBox(height: 16),
                    const _Footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomNav(
        selectedIndex: _selectedTab,
        onSelected: (index) {
          setState(() => _selectedTab = index);
          if (index != 4) {
            const labels = ['Home', 'Practice', 'Test', 'Rank', 'Profile'];
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${labels[index]} navigation is not connected yet.',
                ),
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AspirantPortalApp.surface.withValues(alpha: 0.96),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AspirantPortalApp.primary,
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(Icons.school, color: Colors.white, size: 21),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.3,
              ),
            ),
          ),
          IconButton(
            tooltip: 'Notifications',
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('You are all caught up.')),
            ),
            icon: const Icon(
              Icons.notifications_none,
              color: AspirantPortalApp.muted,
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AspirantPortalApp.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 19),
          ),
        ],
      ),
    );
  }
}

class _SubHeader extends StatelessWidget {
  const _SubHeader({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: AspirantPortalApp.container,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onBack,
            child: const SizedBox(
              width: 40,
              height: 40,
              child: Icon(Icons.arrow_back, size: 20),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Settings',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0x1A003524),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, color: Color(0xFF50DEA9), size: 9),
              SizedBox(width: 6),
              Text(
                'Active Aspirant',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AspirantPortalApp.tertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  static const String _portraitUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuB-xajAMDDIzqsywf-f0PE3EPgDkJQTv44GnX6Xr7NCSkuozxiJGoA-wJaDGO0FHRfgVc8R66o3X3rLEgVZ9CY_jVjEW4m6tGn6DxNcY_R6RGZVhxEhc1S78dwcnbADD9Z6AKyy-uUcpYwHZUZ3QeZB4aHlJ0p_FJo_Hlr0-bHBjMwlHkcRRdzXQcWexknpHSp4bpsreufuN1wbnQhcKkdPj-V1pqGXO-pCXTxAPMs';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.045),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipOval(
                    child: Image.network(
                      _portraitUrl,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 64,
                        height: 64,
                        color: AspirantPortalApp.containerHigh,
                        child: const Icon(
                          Icons.person,
                          color: AspirantPortalApp.primary,
                          size: 34,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -1,
                    bottom: -1,
                    child: Container(
                      width: 21,
                      height: 21,
                      decoration: BoxDecoration(
                        color: AspirantPortalApp.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.verified,
                        color: Colors.white,
                        size: 13,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Akshay Patil',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        _ClassBadge(),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      'akshay@gmail.com',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: AspirantPortalApp.muted,
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        Icon(
                          Icons.school,
                          color: AspirantPortalApp.secondary,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'MHT-CET 2026 • PCM Group',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              color: AspirantPortalApp.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
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
              color: AspirantPortalApp.surface,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AspirantPortalApp.containerHigh,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.local_fire_department,
                    color: AspirantPortalApp.primary,
                    size: 19,
                  ),
                ),
                const SizedBox(width: 9),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daily Streak',
                        style: TextStyle(
                          fontSize: 11,
                          color: AspirantPortalApp.muted,
                          height: 1.2,
                        ),
                      ),
                      Text(
                        '14 Days Clean',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => _showStats(context),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AspirantPortalApp.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: const Text(
                    'View Stats',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static void _showStats(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Study Stats'),
        content: const Text(
          'You have maintained a 14-day study streak. Keep it going!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class _ClassBadge extends StatelessWidget {
  const _ClassBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE6DEFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Class 12',
        style: TextStyle(
          fontSize: 10,
          color: Color(0xFF1C0062),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SettingData {
  const _SettingData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.value,
    this.valueColor,
    this.valueDot = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? value;
  final Color? valueColor;
  final bool valueDot;
  final VoidCallback onTap;
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.title, required this.items});

  final String title;
  final List<_SettingData> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 7),
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              letterSpacing: 1,
              color: AspirantPortalApp.outline,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              for (var i = 0; i < items.length; i++) ...[
                _SettingTile(data: items[i]),
                if (i != items.length - 1)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AspirantPortalApp.surface,
                    ),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({required this.data});

  final _SettingData data;

  @override
  Widget build(BuildContext context) {
    final valueColor = data.valueColor ?? AspirantPortalApp.primary;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: data.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AspirantPortalApp.containerHigh,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(
                  data.icon,
                  size: 21,
                  color: AspirantPortalApp.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      data.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AspirantPortalApp.muted,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              if (data.value != null) ...[
                if (data.valueDot)
                  Container(
                    width: 7,
                    height: 7,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: const BoxDecoration(
                      color: AspirantPortalApp.secondary,
                      shape: BoxShape.circle,
                    ),
                  ),
                _ValueLabel(
                  value: data.value!,
                  color: valueColor,
                  pill:
                      data.value != 'On' &&
                      data.value != 'Light Mode' &&
                      data.value != 'English',
                ),
                const SizedBox(width: 5),
              ],
              const Icon(
                Icons.chevron_right,
                size: 21,
                color: Color(0xFFC9C4D7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ValueLabel extends StatelessWidget {
  const _ValueLabel({
    required this.value,
    required this.color,
    required this.pill,
  });

  final String value;
  final Color color;
  final bool pill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pill
          ? const EdgeInsets.symmetric(horizontal: 9, vertical: 5)
          : EdgeInsets.zero,
      decoration: pill
          ? BoxDecoration(
              color: color == AspirantPortalApp.tertiary
                  ? const Color(0x1A003524)
                  : AspirantPortalApp.containerHigh,
              borderRadius: BorderRadius.circular(20),
            )
          : null,
      child: Text(
        value,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: pill ? color : AspirantPortalApp.onSurface,
        ),
      ),
    );
  }
}

class _LogoutTile extends StatelessWidget {
  const _LogoutTile({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0x33FF6363),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Icon(
                    Icons.logout,
                    size: 20,
                    color: AspirantPortalApp.error,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 14,
                          color: AspirantPortalApp.error,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Securely sign out from this device',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          color: AspirantPortalApp.muted,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  size: 21,
                  color: AspirantPortalApp.error,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            'Dream • Prepare • Achieve',
            style: TextStyle(
              fontSize: 11,
              color: AspirantPortalApp.outline,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 3),
          Text(
            'MHT-CET Aspirant Portal • Session Secure',
            style: TextStyle(fontSize: 10, color: Color(0xFFC9C4D7)),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.selectedIndex, required this.onSelected});

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  static const List<_NavItem> _items = [
    _NavItem(icon: Icons.home_outlined, label: 'Home'),
    _NavItem(icon: Icons.edit_note, label: 'Practice'),
    _NavItem(icon: Icons.quiz_outlined, label: 'Test'),
    _NavItem(icon: Icons.leaderboard_outlined, label: 'Rank'),
    _NavItem(
      icon: Icons.account_circle_outlined,
      label: 'Profile',
      selectedIcon: Icons.account_circle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AspirantPortalApp.surface.withValues(alpha: 0.98),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 0; i < _items.length; i++)
                Expanded(
                  child: _NavButton(
                    item: _items[i],
                    selected: selectedIndex == i,
                    onTap: () => onSelected(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  const _NavItem({required this.icon, required this.label, this.selectedIcon});

  final IconData icon;
  final IconData? selectedIcon;
  final String label;
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? AspirantPortalApp.primary
        : AspirantPortalApp.muted;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selected ? (item.selectedIcon ?? item.icon) : item.icon,
              size: 24,
              color: color,
            ),
            const SizedBox(height: 2),
            Text(
              item.label,
              style: TextStyle(
                fontSize: 10,
                color: color,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
