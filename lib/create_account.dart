import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _education = 'Class 12 (HSC Board)';
  String _stream = 'PCM';
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  static const Color primary = Color(0xFF4520B8);
  static const Color primaryDark = Color(0xFF2E0093);
  static const Color surfaceLow = Color(0xFFF6F2FF);
  static const Color surfaceHigh = Color(0xFFE9E5FF);
  static const Color onSurface = Color(0xFF1A1A2C);
  static const Color muted = Color(0xFF484554);
  static const Color outline = Color(0xFF797586);

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  String? _required(String? value, String label) {
    if (value == null || value.trim().isEmpty) return 'Enter your $label';
    return null;
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
    Widget? prefix,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0x99797586), fontSize: 14),
      prefixIcon: prefix ?? Icon(icon, color: outline, size: 20),
      suffixIcon: suffix,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primary, width: 1.3),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFBA1A1A)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFBA1A1A)),
      ),
    );
  }

  Widget _fieldLabel(String label, {String? trailing}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: muted,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (trailing != null)
            Text(
              trailing,
              style: const TextStyle(
                color: Color(0xFF5E3ED5),
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }

  Widget _groupButton(String value, String subtitle) {
    final selected = _stream == value;
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => setState(() => _stream = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 5),
          decoration: BoxDecoration(
            color: selected ? primary : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(
                  color: selected ? Colors.white : onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: selected ? const Color(0xFFB4A5FF) : outline,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    if (_passwordController.text != _confirmPasswordController.text) {
      _showMessage('Password and Confirm Password do not match.');
      return;
    }
    _showMessage(
      'UI is ready. Connect your authentication backend to sign up.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Top navigation bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _roundIconButton(
                            icon: Icons.arrow_back,
                            backgroundColor: const Color(0xFFEFEBFF),
                            iconColor: primaryDark,
                            onTap: () => Navigator.maybePop(context),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: surfaceHigh,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.school,
                                  size: 18,
                                  color: primaryDark,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'CET PREP 2025',
                                  style: TextStyle(
                                    color: primaryDark,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _roundIconButton(
                            icon: Icons.help_outline,
                            backgroundColor: surfaceLow,
                            iconColor: muted,
                            onTap: () => _showMessage('Help and support'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),

                      // Header
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFEBFF),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 8,
                                color: Color(0xFF5E3ED5),
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Maharashtra CET Portal',
                                style: TextStyle(
                                  color: Color(0xFF5E3ED5),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 9),
                      const Text(
                        'Create Account',
                        style: TextStyle(
                          color: onSurface,
                          fontSize: 22,
                          height: 1.35,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        'Start your focused MHT CET exam journey today.',
                        style: TextStyle(
                          color: muted,
                          fontSize: 14,
                          height: 1.55,
                        ),
                      ),
                      const SizedBox(height: 22),

                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _fieldLabel(
                              'Full Name',
                              trailing: 'Official HSC record',
                            ),
                            TextFormField(
                              controller: _nameController,
                              textCapitalization: TextCapitalization.words,
                              decoration: _inputDecoration(
                                hint: 'e.g. Akshay Patil',
                                icon: Icons.person,
                              ),
                              validator: (v) => _required(v, 'full name'),
                            ),
                            const SizedBox(height: 14),

                            _fieldLabel('Mobile Number'),
                            TextFormField(
                              controller: _mobileController,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              decoration: _inputDecoration(
                                hint: '98765 43210',
                                icon: Icons.phone,
                                prefix: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: surfaceLow,
                                    borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(12),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        size: 18,
                                        color: outline,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '+91',
                                        style: TextStyle(
                                          color: onSurface,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).copyWith(counterText: ''),
                              validator: (v) {
                                if (v == null || v.trim().isEmpty) {
                                  return 'Enter your mobile number';
                                }
                                if (!RegExp(
                                  r'^[6-9][0-9]{9}$',
                                ).hasMatch(v.trim())) {
                                  return 'Enter a valid 10-digit mobile number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 14),

                            _fieldLabel('Email Address'),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: _inputDecoration(
                                hint: 'akshay@gmail.com',
                                icon: Icons.mail_outline,
                              ),
                              validator: (v) {
                                if (v == null || v.trim().isEmpty) {
                                  return 'Enter your email address';
                                }
                                if (!RegExp(
                                  r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                ).hasMatch(v.trim())) {
                                  return 'Enter a valid email address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 14),

                            _fieldLabel('Education / Class'),
                            DropdownButtonFormField<String>(
                              initialValue: _education,
                              isExpanded: true,
                              icon: const Icon(
                                Icons.expand_more,
                                color: outline,
                              ),
                              decoration: _inputDecoration(
                                hint: '',
                                icon: Icons.school,
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: 'Class 12 (HSC Board)',
                                  child: Text('Class 12 (HSC Board)'),
                                ),
                                DropdownMenuItem(
                                  value: 'Class 12 (CBSE Board)',
                                  child: Text('Class 12 (CBSE Board)'),
                                ),
                                DropdownMenuItem(
                                  value: 'Class 11 (Foundation)',
                                  child: Text('Class 11 (Foundation)'),
                                ),
                                DropdownMenuItem(
                                  value: 'Repeater / Dropper Batch',
                                  child: Text('Repeater / Dropper Batch'),
                                ),
                              ],
                              onChanged: (v) => setState(() => _education = v!),
                            ),
                            const SizedBox(height: 18),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Target Exam Stream',
                                  style: TextStyle(
                                    color: muted,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.tune,
                                      size: 14,
                                      color: Color(0xFF5E3ED5),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Group Selection',
                                      style: TextStyle(
                                        color: Color(0xFF5E3ED5),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 9),
                            Row(
                              children: [
                                _groupButton('PCM', 'Engineering'),
                                const SizedBox(width: 10),
                                _groupButton('PCB', 'Pharmacy'),
                                const SizedBox(width: 10),
                                _groupButton('PCMB', 'Both Streams'),
                              ],
                            ),
                            const SizedBox(height: 17),

                            _fieldLabel('Password'),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _hidePassword,
                              decoration: _inputDecoration(
                                hint: 'At least 8 characters',
                                icon: Icons.lock_outline,
                                suffix: IconButton(
                                  onPressed: () => setState(
                                    () => _hidePassword = !_hidePassword,
                                  ),
                                  icon: Icon(
                                    _hidePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: outline,
                                    size: 20,
                                  ),
                                ),
                              ),
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Enter a password';
                                }
                                if (v.length < 8) {
                                  return 'Password must be at least 8 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 14),

                            _fieldLabel('Confirm Password'),
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: _hideConfirmPassword,
                              decoration: _inputDecoration(
                                hint: 'Re-enter password',
                                icon: Icons.verified_user_outlined,
                                suffix: IconButton(
                                  onPressed: () => setState(
                                    () => _hideConfirmPassword =
                                        !_hideConfirmPassword,
                                  ),
                                  icon: Icon(
                                    _hideConfirmPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: outline,
                                    size: 20,
                                  ),
                                ),
                              ),
                              validator: (v) => _required(v, 'password again'),
                            ),
                            const SizedBox(height: 15),

                            const Row(
                              children: [
                                Icon(
                                  Icons.verified,
                                  size: 16,
                                  color: Color(0xFF5E3ED5),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Includes free Maharashtra state quota rank predictor.',
                                    style: TextStyle(
                                      color: muted,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),

                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primary,
                                  foregroundColor: Colors.white,
                                  elevation: 3,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.3,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(Icons.arrow_forward, size: 18),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Social sign-up divider and buttons
                      const SizedBox(height: 29),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(color: Color(0xFFE3E0FA)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Text(
                              'OR CONTINUE WITH',
                              style: TextStyle(
                                color: outline,
                                fontSize: 11,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(color: Color(0xFFE3E0FA)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialButton(
                            child: const Text(
                              'G',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF4285F4),
                              ),
                            ),
                            onTap: () => _showMessage(
                              'Google sign-in requires Firebase/Auth setup.',
                            ),
                          ),
                          const SizedBox(width: 16),
                          _socialButton(
                            child: const Icon(
                              Icons.apple,
                              size: 25,
                              color: onSurface,
                            ),
                            onTap: () => _showMessage(
                              'Apple sign-in requires authentication setup.',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(color: muted, fontSize: 14),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/login'),
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF5E3ED5),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _roundIconButton({
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: backgroundColor,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(icon, size: 21, color: iconColor),
        ),
      ),
    );
  }

  Widget _socialButton({required Widget child, required VoidCallback onTap}) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 1,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(width: 52, height: 52, child: Center(child: child)),
      ),
    );
  }
}
