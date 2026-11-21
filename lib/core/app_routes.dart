import 'package:flutter/material.dart';

import '../screens/select_exam_group_screen.dart';
import '../screens/subject_selection_screen.dart';
import '../screens/chapter_list_screen.dart';
import '../screens/chapter_details_screen.dart';
import '../screens/mcq_question_screen.dart';
import '../screens/question_palette_screen.dart';
import '../screens/solution_explanation_screen.dart';
import '../screens/cbt_live_screen.dart';
import '../screens/test_results_screen.dart';
import '../screens/test_analysis_screen.dart';
import '../screens/analytics_screen.dart';
import '../screens/profile.dart';

import '../create_account.dart';
import '../login_page.dart';
import '../home_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String createAccount = '/create-account';
  static const String login = '/login';
  static const String home = '/home';
  static const String selectExamGroup = '/select-exam-group';
  static const String subjectSelection = '/subject-selection';
  static const String chapterList = '/chapter-list';
  static const String chapterDetails = '/chapter-details';
  static const String mcqQuestion = '/mcq-question';
  static const String questionPalette = '/question-palette';
  static const String solutionExplanation = '/solution-explanation';
  static const String cbtLive = '/cbt-live';
  static const String testResults = '/test-results';
  static const String testAnalysis = '/test-analysis';
  static const String analytics = '/analytics';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> get routes => {
        createAccount: (context) => const CreateAccountScreen(),
        login: (context) => const LoginScreen(),
        home: (context) => const HomeScreen(),
        selectExamGroup: (context) => const SelectExamGroupScreen(),
        subjectSelection: (context) => const SubjectSelectionScreen(),
        chapterList: (context) => const ChapterListScreen(),
        chapterDetails: (context) => const ChapterDetailsScreen(),
        mcqQuestion: (context) => const McqQuestionScreen(),
        questionPalette: (context) => const QuestionPaletteScreen(),
        solutionExplanation: (context) => const SolutionExplanationScreen(),
        cbtLive: (context) => const CbtLiveScreen(),
        testResults: (context) => const TestResultsScreen(),
        testAnalysis: (context) => const TestAnalysisScreen(),
        analytics: (context) => const AnalyticsScreen(),
        profile: (context) => const ProfileSettingsPage(),
      };
}