import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/social_app/social_layout/social_layout.dart';
import 'package:login/shared/component/components.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SocialRegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
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
                          'Register now to Communicate with your friends',
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
                          suffix: SocialRegisterCubit.get(context).suffix,
                          onPressed: () {
                            SocialRegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          isPassword:
                              SocialRegisterCubit.get(context).isPasswordShown,
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
                                  SocialRegisterCubit.get(context).userRegister(
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
                          condition: state is! SocialRegisterLoadingState,
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
          if (state is SocialCreateUserSuccessState) {
            navigateAndFinish(
              context,
              SocialLayout(),
            );
          }
        },
      ),
    );
  }
}
