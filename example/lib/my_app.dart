import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Ninja Core'), centerTitle: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ButtonsWithoutIcon(isDisabled: false),
              const ButtonsWithoutIcon(isDisabled: true),
              NjButtonWithIcon(
                text: Theme.of(context).brightness == Brightness.light
                    ? 'Toggle Theme to Dark Theme'
                    : 'Toggle Theme to Light Theme',
                icon: Theme.of(context).brightness == Brightness.light
                    ? Icons.brightness_3
                    : Icons.brightness_7,
                onPressed: () {
                  NinjaThemeProvider.toggleTheme(context);
                },
              ),
              // const ButtonsWithIcon(),
              const Center(child: Text('Hello World'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => NinjaThemeProvider.toggleTheme(context),
          child: const Icon(Icons.add),
        ));
  }
}

class TextStyleExample extends StatelessWidget {
  const TextStyleExample({super.key, required this.name, required this.style});

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(name, style: style),
    );
  }
}

class ButtonsWithoutIcon extends StatelessWidget {
  final bool isDisabled;

  const ButtonsWithoutIcon({super.key, required this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NjButton(onPressed: isDisabled ? null : () {}, text: 'Elevated'),
          const NjGap.small(),
          NjButton.filled(onPressed: isDisabled ? null : () {}, text: 'Filled'),
          const NjGap.small(),
          NjButton.filledTonal(
              onPressed: isDisabled ? null : () {}, text: 'Filled Tonal'),
          const NjGap.small(),
          NjButton.outline(
              onPressed: isDisabled ? null : () {}, text: "Outlined"),
          const NjGap.small(),
          NjButton.text(onPressed: isDisabled ? null : () {}, text: "Text"),
        ],
      ),
    );
  }
}

class ButtonsWithIcon extends StatelessWidget {
  const ButtonsWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("Icon"),
          ),
          const NjGap.small(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              // Foreground color
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              // Background color
              backgroundColor: Theme.of(context).colorScheme.primary,
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
            onPressed: () {},
            label: const Text('Icon'),
            icon: const Icon(Icons.add),
          ),
          const NjGap.small(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              // Foreground color
              foregroundColor:
                  Theme.of(context).colorScheme.onSecondaryContainer,
              // Background color
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
            onPressed: () {},
            label: const Text('Icon'),
            icon: const Icon(Icons.add),
          ),
          const NjGap.small(),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("Icon"),
          ),
          const NjGap.small(),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("Icon"),
          )
        ],
      ),
    );
  }
}
