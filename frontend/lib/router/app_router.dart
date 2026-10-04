import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';
import '../providers/daily_topic_provider.dart';
import '../models/mock_data.dart';
import '../screens/login_screen.dart';
import '../screens/admin/admin_dashboard.dart';
import '../screens/student/student_main_nav.dart';
import '../screens/student/topic_selection_screen.dart';

class DashboardWrapper extends ConsumerWidget {
  final String title;
  const DashboardWrapper({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).logout();
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          '$title (Placeholder)',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  final dailyTopicState = ref.watch(dailyTopicProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isLoggedIn = authState != null;
      final isLoggingIn = state.matchedLocation == '/login';
      final isSelectingTopic = state.matchedLocation == '/topic_selection';

      if (!isLoggedIn) {
        return isLoggingIn ? null : '/login';
      }

      if (authState.role == UserRole.student) {
        // If they haven't selected a topic, force them to topic selection
        if (!dailyTopicState.hasSelected && !isSelectingTopic) {
          return '/topic_selection';
        }
        // If they have selected a topic and try to go to selection screen, go to student dashboard
        if (dailyTopicState.hasSelected && isSelectingTopic) {
          return '/student';
        }
        // If logging in, go to topic selection (it'll redirect to student if already selected)
        if (isLoggingIn) {
          return '/topic_selection';
        }
      } else if (isLoggingIn) {
        return '/admin';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/topic_selection',
        builder: (context, state) => const TopicSelectionScreen(),
      ),
      GoRoute(
        path: '/student',
        builder: (context, state) => const StudentMainNav(),
      ),
      GoRoute(
        path: '/admin',
        builder: (context, state) => const AdminDashboard(),
      ),
    ],
  );
});
