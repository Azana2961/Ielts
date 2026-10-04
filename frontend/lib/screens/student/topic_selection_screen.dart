import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/tenant_provider.dart';
import '../../providers/daily_topic_provider.dart';

class TopicSelectionScreen extends ConsumerStatefulWidget {
  const TopicSelectionScreen({super.key});

  @override
  ConsumerState<TopicSelectionScreen> createState() => _TopicSelectionScreenState();
}

class _TopicSelectionScreenState extends ConsumerState<TopicSelectionScreen> {
  bool _showWelcome = false;
  bool _showTopics = false;

  final List<Map<String, dynamic>> _topics = [
    {
      'title': 'Day to Day Interaction',
      'icon': Icons.people_outline,
      'color': Colors.blue,
      'category': 'Daily Life',
    },
    {
      'title': 'Professional Setting',
      'icon': Icons.work_outline,
      'color': Colors.orange,
      'category': 'Business',
    },
    {
      'title': 'Academic Discussion',
      'icon': Icons.school_outlined,
      'color': Colors.purple,
      'category': 'Education',
    },
    {
      'title': 'Travel & Culture',
      'icon': Icons.flight_takeoff,
      'color': Colors.teal,
      'category': 'Travel',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAnimationSequence();
  }

  Future<void> _startAnimationSequence() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) setState(() => _showWelcome = true);
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) setState(() => _showTopics = true);
  }

  @override
  Widget build(BuildContext context) {
    final tenant = ref.watch(tenantProvider);
    final student = ref.watch(studentProvider);

    return Scaffold(
      backgroundColor: tenant.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: _showWelcome ? 1.0 : 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back, ${student.name}!',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Let's set your focus for today's practice.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 800),
                  opacity: _showTopics ? 1.0 : 0.0,
                  child: ListView.separated(
                    itemCount: _topics.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final topic = _topics[index];
                      return _buildTopicCard(topic, tenant);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopicCard(Map<String, dynamic> topic, TenantConfig tenant) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          ref.read(dailyTopicProvider.notifier).selectTopic(topic['title'], topic['category']);
          context.go('/student');
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: (topic['color'] as Color).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  topic['icon'],
                  color: topic['color'],
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic['title'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      topic['category'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
