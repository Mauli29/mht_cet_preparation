// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mht_cet_preparation/login_page.dart';
import 'package:mht_cet_preparation/main.dart';

void main() {
  testWidgets('shows the MHT CET splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('MHT CET Preparation'), findsOneWidget);
    expect(find.text('Dream  •  Prepare  •  Achieve'), findsOneWidget);
    expect(find.text('PCM • Engineering'), findsOneWidget);
    expect(find.text('PCB • Pharmacy'), findsOneWidget);
    expect(find.text('READY TO RECALL'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    await tester.pump(const Duration(milliseconds: 400));
  });

  testWidgets('opens the create account screen after the splash', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(seconds: 2));
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('Sign Up'), findsOneWidget);
  });

  testWidgets('connects the create account and login screens', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(seconds: 2));
    await tester.pump(const Duration(milliseconds: 400));

    await tester.ensureVisible(find.text('Login'));
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();
    expect(
      find.text('Login to access mocks, tests & analytics'),
      findsOneWidget,
    );

    await tester.ensureVisible(find.text('Sign Up'));
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();
    expect(find.text('Create Account'), findsOneWidget);
  });

  testWidgets('opens the home screen after valid login details', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const LoginScreen(),
        routes: {
          '/home': (_) => const Scaffold(body: Text('Home destination')),
        },
      ),
    );

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'student@example.com',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'demo-password');
    await tester.ensureVisible(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump(const Duration(milliseconds: 900));
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('Home destination'), findsOneWidget);
  });
}
