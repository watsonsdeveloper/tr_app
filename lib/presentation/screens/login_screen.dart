import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tr_app/presentation/view_models/login_view_model.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/utils/constants/routes_constants.dart';
import 'package:tr_app/config.dart';

class LoginScreen extends HookConsumerWidget {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginStateNotifierProvider);
    final loginNotifier = ref.read(loginStateNotifierProvider.notifier);
    final version = useState<String>("unknown");

    Future<void> initPackageInfo() async {
      final info = await PackageInfo.fromPlatform();
      version.value = info.version;
    }

    useEffect(() {
      initPackageInfo();
      return null;
    }, []);

    Future<void> login() async {
      await loginNotifier.resetState();
      if (loginState.isLoading) return;
      if (!formKey.currentState!.validate()) return;
      String username = usernameController.text;
      String password = passwordController.text;
      final isLogin = await loginNotifier.login(username, password);
      if (!isLogin) return;
      ref.read(userNotifierProvider.notifier).getUser();
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.cartScreen,
        (Route<dynamic> route) => false,
      );
      // });
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 320),
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Tester App ${Config.env == 'PROD' ? '' : Config.env}',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/logo.svg',
                        semanticsLabel: 'Logo',
                        width: 200,
                        height: 80,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          child: loginState.isLoading
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      if (loginState.errorMessage != null &&
                          loginState.errorMessage!.isNotEmpty)
                        Text(loginState.errorMessage!,
                            style: const TextStyle(color: Colors.red)),
                      const SizedBox(height: 16),
                      Text(
                        'Version ${version.value}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
