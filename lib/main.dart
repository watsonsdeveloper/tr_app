import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tr_app/ui/screens/login_screen.dart';
import 'package:tr_app/ui/screens/home_screen.dart';

void main() {
  runApp(ProviderScope(child: TrApp()));
}

class TrApp extends ConsumerWidget {
  TrApp({super.key});

  final authProvider = StateProvider<String?>((ref) => null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userToken = ref.watch(authProvider);

    return MaterialApp(
      title: 'Tr App',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => const HomePage(
              title: 'home',
            ),
      },
      theme: ThemeData(
        primaryColor: Colors.cyan.shade400,
        scaffoldBackgroundColor: Colors.white,
        hintColor: Colors.grey.shade300,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.cyan.shade700,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.cyan.shade700),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF74AEBA),
          secondary: const Color(0xFF03DAC6),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          outline: const Color(0xFF74AEBA),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            // borderSide: BorderSide(color: Color.fromRGBO(220, 220, 220, 1)),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          // focusedBorder: const OutlineInputBorderTheme(),
          // errorBorder: const OutlineInputBorderTheme(),
          // focusedErrorBorder: const OutlineInputBorderTheme(),
          hintStyle: TextStyle(color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
        useMaterial3: true,
      ),
      home: userToken != null ? const HomePage(title: 'home') : LoginPage(),
    );
  }
}
