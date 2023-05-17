import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:example/src/screens/widgets/custom_header_content_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    if ( M3ViewService.isDesktop()) {
      return CustomContentHeaderWeb(title: 'M3 Switch', child:Expanded(child: _body()));
    }
    return Scaffold(
      appBar: const CustomAppBar(title: 'Switch Screen'),
      body: M3Padding.medium(
        child: _body(),
      ),
    );
  }

  ListView _body() {
    return ListView(
      shrinkWrap: true,
      children: const [
        M3Switchs(normalIcon: Icons.close, selectedIcon: Icons.check),
        M3Space.medium(),
        M3SwitchPrimary(normalIcon: Icons.close, selectedIcon: Icons.check),
        M3Space.medium(),
        M3SwitchTertiary(normalIcon: Icons.close, selectedIcon: Icons.check),
        M3Space.medium(),
        M3SwtichAdaptive(),
      ],
    );
  }
}

class M3SwitchTertiary extends StatelessWidget {
  final IconData? normalIcon;
  final IconData? selectedIcon;
  const M3SwitchTertiary({super.key, this.normalIcon, this.selectedIcon});

  @override
  Widget build(BuildContext context) {
    return M3Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const M3Padding(
          padding: M3EdgeInsets.only(bottom: M3Spacing.medium),
          child: M3Text.titleLarge(
              text: 'M3 Switch Tertiary', fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(child: M3Switch.tertiary(value: false, onChanged: (v) {})),
            const Expanded(
                child: M3Switch.tertiary(value: false, onChanged: null)),
            Expanded(child: M3Switch.tertiary(value: true, onChanged: (v) {})),
            const Expanded(
                child: M3Switch.tertiary(value: true, onChanged: null)),
          ],
        ),
        const M3Space.medium(),
        const M3Padding(
          padding: M3EdgeInsets.only(bottom: M3Spacing.medium),
          child: M3Text.titleLarge(
              text: 'M3 Switch Tertiary with Icon',
              fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: M3Switch.tertiary(
                value: false,
                onChanged: (v) {},
                normalIcon: normalIcon,
                selectedIcon: selectedIcon,
              ),
            ),
            Expanded(
              child: M3Switch.tertiary(
                value: false,
                onChanged: null,
                normalIcon: normalIcon,
                selectedIcon: selectedIcon,
              ),
            ),
            Expanded(
              child: M3Switch.tertiary(
                value: true,
                onChanged: (v) {},
                normalIcon: normalIcon,
                selectedIcon: selectedIcon,
              ),
            ),
            Expanded(
              child: M3Switch.tertiary(
                value: true,
                onChanged: null,
                normalIcon: normalIcon,
                selectedIcon: selectedIcon,
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

class M3SwitchPrimary extends StatelessWidget {
  final IconData? normalIcon;
  final IconData? selectedIcon;
  const M3SwitchPrimary({super.key, this.normalIcon, this.selectedIcon});

  @override
  Widget build(BuildContext context) {
    return M3Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const M3Padding(
            padding: M3EdgeInsets.only(bottom: M3Spacing.medium),
            child: M3Text.titleLarge(
                text: 'M3 Switch Primary', fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: M3Switch.primary(value: false, onChanged: (v) {})),
              const Expanded(
                  child: M3Switch.primary(value: false, onChanged: null)),
              Expanded(child: M3Switch.primary(value: true, onChanged: (v) {})),
              const Expanded(
                  child: M3Switch.primary(value: true, onChanged: null)),
            ],
          ),
          const M3Space.medium(),
          const M3Padding(
            padding: M3EdgeInsets.only(bottom: M3Spacing.medium),
            child: M3Text.titleLarge(
                text: 'M3 Switch Primary with Icon',
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: M3Switch.primary(
                value: false,
                onChanged: (v) {},
                normalIcon: normalIcon,
                selectedIcon: selectedIcon,
              )),
              Expanded(
                  child: M3Switch.primary(
                value: false,
                onChanged: null,
                normalIcon: normalIcon,
                selectedIcon: selectedIcon,
              )),
              Expanded(
                  child: M3Switch.primary(
                value: true,
                onChanged: (v) {},
                normalIcon: normalIcon,
                selectedIcon: selectedIcon,
              )),
              Expanded(
                  child: M3Switch.primary(
                value: true,
                onChanged: null,
                normalIcon: normalIcon,
                selectedIcon: selectedIcon,
              )),
            ],
          ),
        ],
      ),
    );
  }
}

class M3SwtichAdaptive extends StatelessWidget {
  const M3SwtichAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    return M3Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const M3Padding(
            padding: M3EdgeInsets.only(bottom: M3Spacing.medium),
            child: M3Text.titleLarge(
                text: 'M3 Switch Adaptive', fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: M3Switch.adaptive(value: false, onChanged: (v) {})),
              const Expanded(
                  child: M3Switch.adaptive(value: false, onChanged: null)),
              Expanded(
                  child: M3Switch.adaptive(value: true, onChanged: (v) {})),
              const Expanded(
                child: M3Switch.adaptive(value: true, onChanged: null),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class M3Switchs extends StatelessWidget {
  final IconData? normalIcon;
  final IconData? selectedIcon;
  const M3Switchs({super.key, this.normalIcon, this.selectedIcon});

  @override
  Widget build(BuildContext context) {
    return M3Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const M3Padding(
            padding: M3EdgeInsets.only(bottom: M3Spacing.medium),
            child: M3Text.titleLarge(
                text: 'M3 Switch', fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: M3Switch(value: false, onChanged: (v) {})),
              const Expanded(child: M3Switch(value: false, onChanged: null)),
              Expanded(child: M3Switch(value: true, onChanged: (v) {})),
              const Expanded(child: M3Switch(value: true, onChanged: null)),
            ],
          ),
          const M3Space.medium(),
          const M3Padding(
              padding: M3EdgeInsets.only(bottom: M3Spacing.medium),
              child: M3Text.titleLarge(
                  text: 'M3 Switch with Icon', fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: M3Switch(
                value: false,
                onChanged: (v) {},
                normalIcon: normalIcon,
                selectedIcon: selectedIcon,
              )),
              Expanded(
                  child: M3Switch(
                value: false,
                onChanged: null,
                normalIcon: normalIcon,
                selectedIcon: selectedIcon,
              )),
              Expanded(
                  child: M3Switch(
                value: true,
                onChanged: (v) {},
                normalIcon: normalIcon,
                selectedIcon: selectedIcon,
              )),
              Expanded(
                  child: M3Switch(
                value: true,
                onChanged: null,
                normalIcon: normalIcon,
                selectedIcon: selectedIcon,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
