import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/shop_app/shop_layout.dart';
import 'package:login/module/shop_app/shop_register_screen/cubit/states.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/component/constants.dart';
import 'package:login/shared/network/local/cashe_helper.dart';

import 'cubit/cubit.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
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
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        Text(
                          'Register now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultTextForm(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Name not allowed to be Empty';
                            }
                            return null;
                          },
                          label: 'Name',
                          prefix: Icons.person,
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
                          suffix: ShopRegisterCubit.get(context).suffix,
                          onPressed: () {
                            ShopRegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          isPassword:
                              ShopRegisterCubit.get(context).isPasswordShown,
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
                        defaultTextForm(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Phone not allowed';
                            }
                            return null;
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          builder: (context) {
                            return defaultButton(
                              text: 'register',
                              function: () {
                                if (formKey.currentState.validate()) {
                                  ShopRegisterCubit.get(context).userRegister(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    lang: 'en',
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              isUpperCase: true,
                            );
                          },
                          condition: state is! ShopRegisterLoadingState,
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
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
          if (state is ShopRegisterSuccessState) {
            if (state.loginModel.status) {
              print(state.loginModel.message);
              print(state.loginModel.data.token);
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
