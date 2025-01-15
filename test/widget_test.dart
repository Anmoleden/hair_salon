import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon/main.dart'; // Correct import

void main() {
  testWidgets('WelcomeScreen widgets are displayed correctly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(const MyApp()); // Ensure MyApp is correct in main.dart

    // Verify that the welcome screen contains the app logo image.
    expect(find.byType(Image), findsOneWidget);

    // Verify that the welcome text is displayed.
    expect(find.text('Discover the Trendy Hairstyle'), findsOneWidget);

    // Verify that the description text is displayed.
    expect(
        find.text(
            'Explore all the latest hairstyles that suit you with just a few clicks.'),
        findsOneWidget);

    // Verify that the 'Login' button is displayed.
    expect(find.text('Login'), findsOneWidget);

    // Tap the 'Login' button and trigger a frame.
    await tester.tap(find.text('Login'));
    await tester.pump();

    // Verify that the login options dialog is shown.
    expect(find.text('Login Options'), findsOneWidget);
  });
}
