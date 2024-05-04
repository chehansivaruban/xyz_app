import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/values/images.dart';
import 'widgets/home_header.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HomeHeader(),
            Text(
              'Featured',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(
                        'https://via.placeholder.com/400x450/FF0000/FFFFFF',
                        fit: BoxFit.fill,
                      ),
                      Text('Product Name'),
                      Text('Price'),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
