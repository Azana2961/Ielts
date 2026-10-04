import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isStudent = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.language,
                size: 80,
                color: Color(0xFF2563EB),
              ),
              const SizedBox(height: 24),
              const Text(
                'AI IELTS Practice',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in to continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 48),
              SegmentedButton<bool>(
                segments: const [
                  ButtonSegment<bool>(
                    value: true,
                    label: Text('Student'),
                    icon: Icon(Icons.person),
                  ),
                  ButtonSegment<bool>(
                    value: false,
                    label: Text('Academy Admin'),
                    icon: Icon(Icons.admin_panel_settings),
                  ),
                ],
                selected: {_isStudent},
                onSelectionChanged: (Set<bool> newSelection) {
                  setState(() {
                    _isStudent = newSelection.first;
                  });
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_isStudent) {
                    ref.read(authProvider.notifier).loginAsStudent();
                  } else {
                    ref.read(authProvider.notifier).loginAsAdmin();
                  }
                },
                child: const Text('Mock Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
