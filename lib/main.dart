import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/data/models/global_model.dart';
import 'package:tr_app/data/models/user_model.dart';
import 'package:tr_app/presentation/providers/global_provider.dart';
import 'package:tr_app/presentation/screens/login_screen.dart';
import 'package:tr_app/presentation/screens/home_screen.dart';
import 'package:tr_app/presentation/screens/order_batch_screen.dart';
import 'package:tr_app/presentation/screens/order_screen.dart';
import 'package:tr_app/presentation/screens/request_item_detail_screen.dart';
import 'package:tr_app/presentation/screens/tester_request_listing_screen.dart';
import 'package:tr_app/presentation/screens/scan_ip_screen.dart';
import 'package:tr_app/presentation/screens/tester_request_screen.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/utils/constants/hive_constants.dart';
import 'package:tr_app/utils/constants/routes_constants.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(GlobalModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<UserModel>(HiveBox.userBox);
  await Hive.openBox<GlobalModel>(HiveBox.globalBox);
  runApp(const ProviderScope(child: TrApp()));
}

class TrApp extends HookConsumerWidget {
  const TrApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userNotifierProvider.select((state) => state.user));
    final storeIP = ref.watch(globalSNP.select((state) => state.storeIP));

    debugPrint('main.dart @ storeIP: $storeIP');
    debugPrint('main.dart @ user: ${user?.toJson()}');
    debugPrint('main.dart @ build');

    return MaterialApp(
      title: 'Tr App',
      routes: {
        Routes.login: (context) => LoginScreen(),
        Routes.home: (context) => const HomeScreen(),
        Routes.productDetail: (context) => const RequestItemDetailPage(),
        Routes.testerRequestListing: (context) =>
            const TesterRequestListingScreen(),
        Routes.testerRequest: (context) => const TesterRequestScreen(),
        Routes.orderBatch: (context) => const OrderBatchScreen(),
        Routes.order: (context) => const OrderScreen(),
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
      home: storeIP == null
          ? ScanIPScreen()
          : user?.token != null
              ? const TesterRequestScreen()
              : LoginScreen(),
      // home: TesterRequestScreen(),
    );
  }
}
