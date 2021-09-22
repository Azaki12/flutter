import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/shop_app/shop_layout.dart';
import 'package:login/module/shop_app/login/cubit/cubit.dart';
import 'package:login/module/shop_app/shop_register_screen/register_screen.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/component/constants.dart';
import 'package:login/shared/network/local/cashe_helper.dart';

import 'cubit/states.dart';

class ShopLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
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
                          'login now to browse our hot offers',
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
                          suffix: ShopLoginCubit.get(context).suffix,
                          onSubmit: (value) {
                            if (formKey.currentState.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                lang: 'en',
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          onPressed: () {
                            ShopLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          isPassword:
                              ShopLoginCubit.get(context).isPasswordShown,
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
                                  ShopLoginCubit.get(context).userLogin(
                                    lang: 'en',
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              isUpperCase: true,
                            );
                          },
                          condition: state is! ShopLoginLoadingState,
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
                                navigateTo(context, RegisterScreen());
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
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status) {
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data.token,
              ).then((value) {
                token = state.loginModel.data.token;
                navigateAndFinish(context, ShopLayout());
              });
              // go to home
            } else {
              // print on toast
              // toastLength for android
              // timeInSecForIosWeb
              showToast(
                message: state.loginModel.message,
                state: ToastStates.ERROR,
              );
            }
          }
        },
      ),
    );
  }
}
