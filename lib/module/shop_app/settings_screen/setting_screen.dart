import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/shop_app/cubit/cubit.dart';
import 'package:login/layout/shop_app/cubit/states.dart';
import 'package:login/module/shop_app/login/shop_login_screen.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/component/constants.dart';

class SettingsShopScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      builder: (context, state) {
        var model = ShopCubit.get(context).user;

        nameController.text = model.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;

        return ConditionalBuilder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if (state is ShopLoadingUpdateUserDataState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultTextForm(
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Name cant be empty';
                        }
                        return null;
                      },
                      label: 'Name',
                      prefix: Icons.person,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultTextForm(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Email cant be empty';
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
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Phone cant be empty';
                        }
                        return null;
                      },
                      label: 'Phone Number',
                      prefix: Icons.phone,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                      text: 'Logout',
                      isUpperCase: true,
                      function: () {
                        signOut(context, ShopLoginScreen(), token);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                      text: 'Update',
                      isUpperCase: true,
                      function: () {
                        if (formKey.currentState.validate()) {
                          ShopCubit.get(context).updateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          condition: ShopCubit.get(context).user != null,
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
