import 'package:ecom_app/bloc/login/login_event.dart';
import 'package:ecom_app/common/form_field.dart';
import 'package:ecom_app/common/primary_button.dart';
import 'package:ecom_app/utils/utils.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login/login_bloc.dart';
import '../../bloc/login/login_state.dart';
import '../../styles/colors.dart';
import '../home/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        if (state is LoginErrorState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Error !!'),
                  content: const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text('Either email or password incorrect.'),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0),
                  buttonPadding: const EdgeInsets.only(bottom: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        'OK',
                        style: TextStyle(color: primary, fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          });
        } else if (state is LoginLoadedState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => const HomePage()),
            );
          });
          Utils.toastMessage('Login Sucessful!!!');
        }

        return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                      height: 100,
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  //Email Field
                  FormFieldWidgets(
                    labelText: 'Email',
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    controller: emailController,
                    visibleText: false,
                    onChanged: (value) {
                      setState(() {
                        emailController.text = value;
                      });
                      // context
                      //     .read<LoginBloc>()
                      //     .add(EmailEvent(emailController.text));
                      // // print(emailController.text);
                      // BlocProvider.of<LoginBloc>(context)
                      //     .add(EmailEvent(emailController.text));
                      if (state is LoginErrorState) {
                        // Clear the error state when the field is changed
                        context.read<LoginBloc>().add(ClearFormEvent());
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  //Email Field End
                  const SizedBox(
                    height: 30,
                  ),
                  // Password Field
                  FormFieldWidgets(
                    hintText: 'Password',
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    visibleText: isVisible,
                    controller: passwordController,
                    onChanged: (value) {
                      setState(() {
                        passwordController.text = value;
                      });
                      // context
                      //     .read<LoginBloc>()
                      //     .add(PasswordEvent(passwordController.text));
                      if (state is LoginErrorState) {
                        // Clear the error state when the field is changed
                        context.read<LoginBloc>().add(ClearFormEvent());
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (state is LoginErrorState) {
                        return state.error;
                      }
                      return null;
                    },
                  ),
                  // Password field end
                  const Spacer(),
                  PrimaryButton(
                    inputText: 'Login',
                    height: 50,
                    width: double.infinity,
                    radius: 20,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<LoginBloc>().add(LoginButtonEvent(
                              emailController.text,
                              passwordController.text,
                            ));
                      }
                    },
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
