import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/social_app/social_layout/social_layout.dart';
import 'package:login/module/social_app/social_register/social_register_screen.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/component/constants.dart';
import 'package:login/shared/network/local/cashe_helper.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SocialLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        Text(
                          'login now to Communicate with your friends',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultTextForm(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Empty not allowed';
                            }
                            return null;
                          },
                          label: 'Email Address',
                          prefix: Icons.email,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultTextForm(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: SocialLoginCubit.get(context).suffix,
                          onSubmit: (value) {
                            if (formKey.currentState.validate()) {
                              // SocialLoginCubit.get(context).userLogin(
                              //   lang: 'en',
                              //   email: emailController.text,
                              //   password: passwordController.text,
                              // );
                            }
                          },
                          onPressed: () {
                            SocialLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          isPassword:
                              SocialLoginCubit.get(context).isPasswordShown,
                          validate: (String value) {
                            if (value.isEmpty || value.length < 6) {
                              return 'password is too short';
                            }
                            return null;
                          },
                          label: 'Password',
                          prefix: Icons.lock,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          builder: (context) {
                            return defaultButton(
                              text: 'login',
                              function: () {
                                if (formKey.currentState.validate()) {
                                  SocialLoginCubit.get(context).userLogin(
                                    lang: 'en',
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              isUpperCase: true,
                            );
                          },
                          condition: state is! SocialLoginLoadingState,
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account ? ',
                            ),
                            defaultTextButton(
                              function: () {
                                navigateTo(context, SocialRegisterScreen());
                              },
                              text: 'Register',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is SocialLoginErrorState) {
            showToast(
              message: 'Error',
              state: ToastStates.ERROR,
            );
          }
          if (state is SocialLoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              uId = state.uId;
              navigateAndFinish(context, SocialLayout());
            });
          }
        },
      ),
    );
  }
}
