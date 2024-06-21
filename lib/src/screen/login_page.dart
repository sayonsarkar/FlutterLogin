import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_problem/src/controller/auth/auth_bloc.dart';
import 'package:flutter_problem/src/utils/constants/app_assets.dart';
import 'package:flutter_problem/src/utils/constants/enums.dart';
import 'package:flutter_problem/src/utils/widgets/app_button.dart';
import 'package:flutter_problem/src/utils/widgets/app_text_field.dart';
import 'package:flutter_problem/src/utils/widgets/square_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),

                      // logo
                      const Icon(
                        Icons.lock,
                        size: 100,
                      ),

                      const SizedBox(height: 50),

                      // welcome back, you've been missed!
                      Text(
                        'Sign In!',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // email textfield
                      Focus(
                        onFocusChange: (isFocused) {
                          if (isFocused) {
                            _emailFocus.requestFocus();
                          } else {
                            FocusScope.of(context).unfocus();
                          }
                          context.read<AuthBloc>().add(
                                EmailChanged(
                                  email: emailController.text,
                                ),
                              );
                        },
                        child: MyTextField(
                          focusNode: _emailFocus,
                          controller: emailController,
                          hintText: 'Email',
                          obscureText: false,
                          errorText: state.isValidEmail == EmailState.invalid &&
                                  !_emailFocus.hasFocus
                              ? 'Invlaid email'
                              : null,
                          onChanged: (email) {
                            context.read<AuthBloc>().add(
                                  EmailChanged(
                                    email: email ?? '',
                                  ),
                                );
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      // password textfield
                      Focus(
                        onFocusChange: (isFocussed) {
                          if (isFocussed) {
                            _passwordFocus.requestFocus();
                          } else {
                            FocusScope.of(context).unfocus();
                          }
                          context.read<AuthBloc>().add(
                                PassWordChanged(
                                  password: passwordController.text,
                                ),
                              );
                        },
                        child: MyTextField(
                          focusNode: _passwordFocus,
                          controller: passwordController,
                          hintText: 'Password',
                          onChanged: (password) {
                            context.read<AuthBloc>().add(
                                  PassWordChanged(
                                    password: password ?? '',
                                  ),
                                );
                          },
                          errorText:
                              state.isValidPassWord == PasswordState.invalid &&
                                      !_passwordFocus.hasFocus
                                  ? 'Invlaid password'
                                  : null,
                          obscureText: true,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const SizedBox(height: 25),

                      // sign in button
                      AppButton(
                        buttonColor: state.isValidEmail == EmailState.valid &&
                                state.isValidPassWord == PasswordState.valid
                            ? Colors.black
                            : Colors.grey,
                        onTap: state.isValidEmail == EmailState.valid &&
                                state.isValidPassWord == PasswordState.valid
                            ? () {
                                if (_formKey.currentState?.validate() ??
                                    false) {}
                              }
                            : () {},
                        isLoading: state.isLoading,
                      ),

                      const SizedBox(height: 50),

                      // or continue with
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Or continue with',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      // google + apple sign in buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // google button
                          SquareTile(
                            onTap: () => context.read<AuthBloc>().add(
                                  GoogleSignInEvent(),
                                ),
                            imagePath: AppAssets.googleImg,
                          ),

                          const SizedBox(width: 25),
                        ],
                      ),

                      const SizedBox(height: 25),

                      // not a member? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not a member?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'Register now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
