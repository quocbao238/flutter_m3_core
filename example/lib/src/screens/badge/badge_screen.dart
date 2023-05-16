import 'dart:async';
import 'dart:math';

import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:example/src/screens/widgets/custom_header_content_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';

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

  final timeRefresh = 500; // ms
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(milliseconds: timeRefresh), (timer) => setState(() {}));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (M3DeviceService.isDesktop() || M3DeviceService.isWeb()) {
      return CustomContentHeaderWeb(
          title: 'M3 Badge', child: Expanded(child: _body()));
    }
    return Scaffold(
      appBar: const CustomAppBar(title: 'M3 Badge'),
      body: M3Padding.medium(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        M3Card(
            // width: 1280 / 3.2,
            child: Wrap(
                spacing: M3Spacing.medium.size,
                runSpacing: M3Spacing.medium.size,
                children: listIconsData
                    .map((e) => M3Card(
                          child: M3Padding.regular(
                              child:
                                  M3Badge(count: randomNumber(), iconData: e)),
                        ))
                    .toList())),
        const M3Space.medium(),
        M3Card(
          // width: 1280 / 3.2,
          child: NavigationBar(
            onDestinationSelected: (int? index) =>
                setState(() => currentIndex = index!),
            selectedIndex: currentIndex,
            destinations: [
              ...mapIconsData.entries
                  .map((e) => NavigationDestination(
                        icon: M3Badge(
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
  Icons.verified_user_outlined,
  Icons.verified_user_rounded,
  Icons.verified_user_sharp,
  Icons.verified,
  Icons.verified_outlined,
  Icons.verified_rounded,
  Icons.verified_sharp,
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
