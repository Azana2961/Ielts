enum UserRole { student, admin }

class MockUser {
  final String id;
  final String name;
  final UserRole role;
  final String academyName;
  
  MockUser({
    required this.id,
    required this.name,
    required this.role,
    required this.academyName,
  });
}

class MockTestHistory {
  final String id;
  final String date;
  final String topic;
  final double score;

  MockTestHistory({
    required this.id,
    required this.date,
    required this.topic,
    required this.score,
  });
}

class MockData {
  static final MockUser currentStudent = MockUser(
    id: 'STU-1042',
    name: 'Alex Johnson',
    role: UserRole.student,
    academyName: 'Elite English Academy',
  );

  static final MockUser currentAdmin = MockUser(
    id: 'ADM-001',
    name: 'Sarah Smith',
    role: UserRole.admin,
    academyName: 'Elite English Academy',
  );

  static final List<MockTestHistory> testHistory = [
    MockTestHistory(id: 'T1', date: 'Oct 1, 2023', topic: 'Technology', score: 6.5),
    MockTestHistory(id: 'T2', date: 'Sep 28, 2023', topic: 'Education', score: 6.0),
    MockTestHistory(id: 'T3', date: 'Sep 25, 2023', topic: 'Travel', score: 5.5),
  ];

  static final Map<String, dynamic> mockAIReport = {
    'score': 6.5,
    'overall': 'You have good fluency, but need to work on complex grammar structures.',
    'good': [
      'Maintained steady pace',
      'Used appropriate transition words',
      'Answered the prompt fully'
    ],
    'mistakes': [
      'Used present tense instead of past tense when describing childhood.',
      'Pronunciation of "development" was slightly off.'
    ],
    'lacked': [
      'Advanced vocabulary (idioms, phrasal verbs)',
      'Complex sentence structures (conditionals, relative clauses)'
    ],
    'actionable': 'Practice speaking about past events using past perfect tense.'
  };

  static final List<Map<String, String>> topics = [
    {'category': 'Education', 'prompt': 'Describe a change you would like to see in the education system.'},
    {'category': 'Work', 'prompt': 'Describe a successful business you know about.'},
    {'category': 'Technology', 'prompt': 'Describe a piece of technology you use often.'},
    {'category': 'Travel', 'prompt': 'Describe a memorable journey you have taken.'},
  ];

  static final List<Map<String, String>> students = [
    {'name': 'Alex Johnson', 'id': 'STU-1042', 'status': 'Active', 'joinDate': 'Jan 12, 2023'},
    {'name': 'Maria Garcia', 'id': 'STU-1043', 'status': 'Active', 'joinDate': 'Feb 05, 2023'},
    {'name': 'Wei Chen', 'id': 'STU-1044', 'status': 'Inactive', 'joinDate': 'Mar 20, 2023'},
    {'name': 'Ahmed Ali', 'id': 'STU-1045', 'status': 'Active', 'joinDate': 'Apr 10, 2023'},
  ];
}
