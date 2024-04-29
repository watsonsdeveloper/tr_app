import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/themes/input_theme.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';
import 'package:tr_app/utils/constants/routes_constants.dart';
import 'package:tr_app/presentation/screens/navigation_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);
    final userNotifier = ref.read(userNotifierProvider.notifier);
    final selectedBrand =
        ref.watch(userNotifierProvider).user?.selectedBrand ?? Brand.own;

    debugPrint(
        'home_screen.dart @ selectedBrand : ${userState.user?.selectedBrand}');

    Future<void> selectBrand(Brand selectedBrand) async {
      // await userNotifier.selectBrand(selectedBrand);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamedAndRemoveUntil(context, Routes.testerRequestListing,
            (Route<dynamic> route) => false);
      });
    }

    Future<void> logout() async {
      final userNotifier = ref.read(userNotifierProvider.notifier);
      final isLogout = await userNotifier.logout();
      if (!isLogout) return;

      // WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.login,
        (Route<dynamic> route) => false,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logout Successful'),
          duration: Duration(seconds: 2),
        ),
      );
      // });
    }

    return NavigationScreen(
      selectedRoute: Routes.cartScreen,
      onItemTapped: (index) {
        debugPrint('index : $index');
      },
      bodyContent: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  if (userState.isLoading) return;  
                  if (selectedBrand != Brand.own) {
                    selectBrand(Brand.own);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedBrand != Brand.own ? Colors.white : Colors.orange,
                  minimumSize: const Size(120, 48),
                ),
                child: Text(
                  'Own Brand',
                  style: TextStyle(
                    color: selectedBrand != Brand.own
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
              ),
              const SizedBoxHeight(),
              ElevatedButton(
                onPressed: () {
                  if (userState.isLoading) return;
                  // if (selectedBrand != Brand.supplier) {
                  //   selectBrand(Brand.supplier);
                  // }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedBrand != Brand.supplier
                      ? Colors.white
                      : Colors.orange,
                  minimumSize: const Size(120, 48),
                ),
                child: Text(
                  'A Brand',
                  style: TextStyle(
                    color: selectedBrand != Brand.supplier
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
              ),
              // const SizedBoxHeight(),
              // const SizedBoxHeight(),
              // const SizedBoxHeight(),
              // ElevatedButton(
              //   onPressed: logout,
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.grey[300],
              //     minimumSize: const Size(120, 48),
              //   ),
              //   child: const Text(
              //     'Log Out',
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              // const SizedBoxHeight(),
              // if (userState.errorMessage != null)
              //   Text(userState.errorMessage!,
              //       style: const TextStyle(color: Colors.red)),
              // const SizedBoxHeight(),
            ],
          ),
        ),
      ),
    );
  }
}
