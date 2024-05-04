import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/current_location/current_location_state_provider.dart';
import '../core/values/colors.dart';
import '../routes/app_router.gr.dart';

@RoutePage()
class NavBarPage extends HookConsumerWidget {
  const NavBarPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        Future.delayed(
          const Duration(seconds: 0),
          () async {
            await ref
                .read(currentLocationNotifierProvider.notifier)
                .handleLocationPermission();
            await ref
                .read(currentLocationNotifierProvider.notifier)
                .getCurrentLocation();
          },
        );

        return;
      },
      const [],
    );

    Color getTabColor(int index, int activeIndex) {
      if (index == activeIndex) {
        return AppColors.primaryGreen;
      } else {
        return AppColors.dashboardTextGrey;
      }
    }

    return AutoTabsRouter.pageView(
      physics: const NeverScrollableScrollPhysics(),
      routes: const [
        HomeRoute(),
        ExploreRoute(),
        PurchasesRoute(),
        ChatRoute(),
        ProfileRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: SafeArea(child: child),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(251, 0, 25, 31),
            enableFeedback: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 44.w,
                  height: 36,
                  child: Icon(
                    Icons.home,
                    color: getTabColor(0, tabsRouter.activeIndex),
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 44.w,
                  height: 36,
                  child: Icon(
                    Icons.explore,
                    color: getTabColor(1, tabsRouter.activeIndex),
                  ),
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 44.w,
                  height: 36,
                  child: Icon(
                    Icons.shopping_cart,
                    color: getTabColor(2, tabsRouter.activeIndex),
                  ),
                ),
                label: 'Purchases',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 44.w,
                  height: 36,
                  child: Icon(
                    Icons.chat,
                    color: getTabColor(3, tabsRouter.activeIndex),
                  ),
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 44.w,
                  height: 36,
                  child: Icon(
                    Icons.account_circle,
                    color: getTabColor(4, tabsRouter.activeIndex),
                  ),
                ),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}
