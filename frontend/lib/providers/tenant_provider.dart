import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TenantConfig {
  final String academyName;
  final String logoUrl;
  final Color primaryColor;
  final Color secondaryColor;

  const TenantConfig({
    required this.academyName,
    required this.logoUrl,
    required this.primaryColor,
    required this.secondaryColor,
  });
}

final tenantProvider = Provider<TenantConfig>((ref) {
  // Mock data for white-label theming
  return const TenantConfig(
    academyName: 'KIPS English',
    logoUrl: 'https://via.placeholder.com/150/0047AB/FFFFFF?text=KIPS',
    primaryColor: Color(0xFF0047AB), // Deep Blue
    secondaryColor: Color(0xFF00BFFF), // Light Blue
  );
});

// Mocking User state
class StudentData {
  final String name;
  final int focusBolts;
  final int maxFocusBolts;

  const StudentData({
    required this.name,
    required this.focusBolts,
    required this.maxFocusBolts,
  });
}

final studentProvider = Provider<StudentData>((ref) {
  return const StudentData(
    name: 'Ali',
    focusBolts: 3,
    maxFocusBolts: 3,
  );
});
