# AI IELTS Speaking Practice Platform - Implementation Plan

## Phase 1: Project Initialization & Architecture
1. **Initialize Flutter Project:** Create a new Flutter app targeting iOS and Android.
2. **Setup Dependencies:** Add required packages (State management: `flutter_riverpod`, Routing: `go_router`, UI/Fonts: `google_fonts`, Audio Visualizer, etc.).
3. **Mock Data Models:** Define classes and dummy JSON data for User (Student/Admin), Topics, Prompts, Mock Tests, and AI Reports.
4. **Theming Engine:** Implement a dynamic theming system for white-labeling (Primary/Secondary colors, Academy Logo).

## Phase 2: Authentication & Routing
1. **Login Screen:** Create a mock login UI with a toggle to switch between "Student" and "Admin" roles.
2. **Routing Setup:** Configure `go_router` (or similar) for role-based navigation and authentication state listening.

## Phase 3: Academy Admin Dashboard
1. **Student List Screen:** Implement a table/list view showing enrolled students with dummy data.
2. **Add Student Form:** Build a mock form (BottomSheet or Dialog) to add a new student.

## Phase 4: Student Experience - Core Navigation
1. **Main Scaffolding:** Implement the Bottom Navigation Bar (Home, Practice, History, Profile).
2. **Student Home:** Build the dashboard with hero section and practice summary.
3. **History Screen:** Create a list of past tests.
4. **Profile Screen:** Display basic student/academy info.

## Phase 5: Student Experience - Practice Flow
1. **Topic Selection:** Build the category and prompt selection UI.
2. **The Test Room (Prep Phase):** Implement the 1-minute countdown timer UI with prompt display.
3. **The Test Room (Speaking Phase):** Implement the 2-minute speaking timer, "🔴 Recording" state, and mock audio visualizer.
4. **Processing Screen:** Show a loading state simulating AI analysis.
5. **AI Report Screen:** Render the comprehensive feedback UI based on mock JSON data (Score, Good/Bad points, Actionable tips).

## Phase 6: Polish & Handover
1. Verify all flows with mocked state management.
2. Final UI/UX polish (transitions, empty states).
