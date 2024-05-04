import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

import '../../core/values/images.dart';

class HomeHeader extends StatefulWidget {
  HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int _currentIndex = 0;
  final List<String> imgList = [
    'https://via.placeholder.com/400x200/FF0000/FFFFFF',
    'https://via.placeholder.com/400x200/00FF00/FFFFFF',
    'https://via.placeholder.com/400x200/0000FF/FFFFFF',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: AppImages.homeHeader,
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.lightGreen[100],
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            hintText: 'Search product',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite, color: Colors.green),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.shopping_cart, color: Colors.green),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: CarouselSlider(
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imgList
                      .map((item) => Container(
                            child: Center(
                                child: Image.network(item,
                                    fit: BoxFit.fill, width: 1000)),
                          ))
                      .toList(),
                ),
              ),
              CarouselIndicator(
                cornerRadius: 30,
                height: 10,
                width: 10,
                activeColor: Colors.black,
                count: imgList.length,
                index: _currentIndex,
                color: Colors.brown,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
