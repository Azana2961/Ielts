import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyTopicState {
  final bool hasSelected;
  final String? topicTitle;
  final String? topicCategory;

  const DailyTopicState({
    required this.hasSelected,
    this.topicTitle,
    this.topicCategory,
  });

  DailyTopicState copyWith({
    bool? hasSelected,
    String? topicTitle,
    String? topicCategory,
  }) {
    return DailyTopicState(
      hasSelected: hasSelected ?? this.hasSelected,
      topicTitle: topicTitle ?? this.topicTitle,
      topicCategory: topicCategory ?? this.topicCategory,
    );
  }
}

class DailyTopicNotifier extends Notifier<DailyTopicState> {
  @override
  DailyTopicState build() {
    return const DailyTopicState(hasSelected: false);
  }

  void selectTopic(String title, String category) {
    state = state.copyWith(
      hasSelected: true,
      topicTitle: title,
      topicCategory: category,
    );
  }
}

final dailyTopicProvider = NotifierProvider<DailyTopicNotifier, DailyTopicState>(() {
  return DailyTopicNotifier();
});
