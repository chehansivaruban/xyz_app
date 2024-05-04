import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/authentication/atuthentication_state_provider.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';
import '../../core/widgets/custom_textfield.dart';
import '../../routes/app_router.gr.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username/Email',
          style: sanFranciscoRegular.copyWith(
            fontSize: 15,
            color: AppColors.textGrey,
          ),
        ),
        SizedBox(
          height: 45,
          child: CustomTextField(
            hintText: 'Username',
            textInputType: TextInputType.emailAddress,
            onChanged: (value) {
              ref
                  .read(authenticationNotifierProvider.notifier)
                  .emailChanged(value);
            },
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Password',
          style: sanFranciscoRegular.copyWith(
            fontSize: 15,
            color: AppColors.textGrey,
          ),
        ),
        SizedBox(
          height: 45,
          child: CustomTextField(
            hintText: 'password',
            obscureText: true,
            textInputType: TextInputType.text,
            isSuffix: true,
            suffixOnPress: () {},
            onChanged: (value) {
              ref
                  .read(authenticationNotifierProvider.notifier)
                  .passwordChanged(value);
            },
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                ref.read(authenticationNotifierProvider.notifier).login();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
