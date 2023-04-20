import 'dart:math';

import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class BadgeScreen extends StatefulWidget {
  const BadgeScreen({Key? key}) : super(key: key);

  @override
  State<BadgeScreen> createState() => _BadgeScreenState();
}

class _BadgeScreenState extends State<BadgeScreen> {
  int currentIndex = 0;

  final Map<String, IconData> mapIconsData = {
    'Home': Icons.home,
    'User': Icons.supervised_user_circle,
    'Notification': Icons.notification_add_outlined,
    'Settings': Icons.settings,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ninja Badge'),
      body: NJPadding.medium(
        child: ListView(
          children: [
            NJCard(
                width: 1280 / 3.2,
                child: Wrap(
                    spacing: NJGapSize.medium.size,
                    runSpacing: NJGapSize.medium.size,
                    children: listIconsData
                        .map((e) => NJPadding.regular(
                            child: NJBadge(count: randomNumber(), iconData: e)))
                        .toList())),
            NJCard(
              width: 1280 / 3.2,
              child: NavigationBar(
                onDestinationSelected: (int? index) =>
                    setState(() => currentIndex = index!),
                selectedIndex: currentIndex,
                destinations: [
                  ...mapIconsData.entries
                      .map((e) => NavigationDestination(
                            icon: NJBadge(
                              count: randomNumber(),
                              iconData: e.value,
                            ),
                            label: e.key,
                          ))
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int randomNumber() {
  final random = Random();
  return random.nextInt(1500);
}

final listIconsData = <IconData>[
  Icons.notification_important,
  Icons.notifications,
  Icons.notifications_active,
  Icons.notifications_none,
  Icons.notifications_off,
  Icons.notifications_paused,
  Icons.notifications_none_outlined,
  Icons.notifications_none_rounded,
  Icons.notifications_none_sharp,
  Icons.notifications_off_outlined,
  Icons.notifications_off_rounded,
  Icons.notifications_off_sharp,
  Icons.notifications_outlined,
  Icons.notifications_paused_outlined,
  Icons.notifications_paused_rounded,
  Icons.notifications_paused_sharp,
  Icons.notifications_rounded,
  Icons.notifications_sharp,
  Icons.notifications_active_outlined,
  Icons.notifications_active_rounded,
  Icons.notifications_active_sharp,
  Icons.notifications_none_outlined,
  Icons.notifications_none_rounded,
  Icons.verified_user,
  Icons.verified_user_outlined,
  Icons.verified_user_rounded,
  Icons.verified_user_sharp,
  Icons.verified,
  Icons.verified_outlined,
  Icons.verified_rounded,
  Icons.verified_sharp,
  Icons.verified_user,
];
