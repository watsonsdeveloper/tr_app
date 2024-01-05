import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/ui/screens/tester_request_listing_screen.dart';
import 'package:tr_app/ui/view_models/login_view_model.dart';
import 'package:tr_app/utils/constants.dart';

class LoginPage extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final login = ref.watch(loginUseCaseProvider);
    final loginState = ref.watch(loginViewModelProvider);
    // final loginState = ref.watch(loginProvider);

    useEffect(() {
      if (loginState == LoginState.success) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const TesterRequestListingPage()),
            (Route<dynamic> route) => false,
          );
        });
      }
      return null;
    }, [loginState]);

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
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Tester App',
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
                          onPressed: () async {
                            await ref
                                .read(loginViewModelProvider.notifier)
                                .resetState();
                            if (loginState != LoginState.loading) {
                              if (_formKey.currentState!.validate()) {
                                String username = usernameController.text;
                                String password = passwordController.text;
                                await ref
                                    .read(loginViewModelProvider.notifier)
                                    .login(username, password);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          child: loginState == LoginState.loading
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      if (loginState == LoginState.success)
                        const Text('Login Success',
                            style: TextStyle(color: Colors.green)),
                      if (loginState == LoginState.error)
                        const Text('Login Failed',
                            style: TextStyle(color: Colors.red)),
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
