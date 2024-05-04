import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:xyz_app/presentation/core/values/style_constants.dart';
import 'package:xyz_app/presentation/routes/app_router.gr.dart';

import '../core/values/colors.dart';
import '../core/values/text_styles.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPaddings.innerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 36,
            ),
            Container(
              height: 100,
              width: 100,
              color: AppColors.primaryGreen,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Welcome to Eridanus',
              style: sanFranciscoRegular.copyWith(
                fontSize: 25,
                color: AppColors.primaryGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Login to continue shopping',
              style: sanFranciscoRegular.copyWith(
                fontSize: 15,
                color: AppColors.textGrey,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Username/Email',
              style: sanFranciscoRegular.copyWith(
                fontSize: 15,
                color: AppColors.textGrey,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.textGrey,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textGrey, width: 2.0),
                ),
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
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.textGrey,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textGrey, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Center(
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    context.router.push(const NavBarRoute());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Don\'t have an account?',
                style: sanFranciscoRegular.copyWith(
                  fontSize: 15,
                  color: AppColors.textGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
