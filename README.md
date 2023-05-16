# flutter_m3_core

- Simplifies theme management by providing effortless switching between light, dark, or custom themes. This feature allows you to create visually striking apps with ease.

- The package seamlessly integrates Material 3 components into your app's UI, enabling you to build sleek and intuitive interfaces. This integration ensures a seamless user experience that aligns with the latest design standards.

- With customization options, you can easily tailor the appearance and behavior of Material 3 components to match your app's unique requirements. This level of customization guarantees a cohesive and consistent user experience, enhancing the overall quality of your app.

# 💻 Include in your project

```yaml
dependencies:
  flutter_m3_core: <latest version>
```

# 💻 Import in your project

```dart
import 'package:flutter_m3_core/m3_theme_core.dart';
```

# 👨‍💻 Usage M3 Theme

1. Wrap your material app like this to use dark theme and light theme out of the box.

- **`m3BaseColors`** : Input yor base color you need to use in your app
- **`automationDayNight`** [true/false] default is false. If you want your app auto change theme mode by Time Of Day. Let's set is **`true`**

```dart
class App extends StatelessWidget {
  final m3BaseColors = const Color(0xFF6750A4);
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return M3ThemeProvider(
        m3ThemeManager: M3ThemeManager(m3BaseColors: m3BaseColors),
        m3Builder: (context, themeData, darkTheme, themeMode) => MaterialApp(
            title: 'Flutter M3 Core',
            theme: themeData,
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            themeMode: themeMode,
            home: const MyApp()));
  }
}
```

2. Toggle and get the current theme

- You can toggle theme

```dart
M3ThemeProvider.toggleTheme(context)
```

- You can get current theme mode [ThemeMode]

```dart
M3ThemeProvider.getThemeMode(context);
```

3. Change base color

- User can select favorite color. After selected your app theme will compatible with new color

```dart
M3ThemeProvider.changeM3Color(context,newColor)
```

4. This package already handle to check device size. We have four size [mobile,tablet,desktop,web]

- Wrap this into widget need to check

```dart
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const M3LayoutView(
      mobile: MobileView(),
      tablet: TabletView(),
      desktop: DesktopView(),
      web: DesktopView(),
    );
  }
}
```

# 👨‍💻 Material 3 Components

- This package have many components principle with Material 3 design like Buttons,CheckBox,Slider,Typography,Progress,DatePicker....
- Let's try it

## **1. M3Typography**

#### **Constructors**

```dart
M3Text.displayLarge, M3Text.displayMedium, M3Text.displaySmall, M3Text.headlineLarge, M3Text.headlineMedium, M3Text.headlineSmall, M3Text.titleLarge, M3Text.titleMedium, M3Text.titleSmall, M3Text.labelLarge, M3Text.labelMedium, M3Text.labelSmall, M3Text.bodyLarge, M3Text.bodyMedium, M3Text.bodySmall
```

Each constructor accepts parameters such as text, textAlign, fontWeight, color, maxLines, overflow, and isFlexible to customize the appearance and behavior of the text.

#### **Usage**

To use the M3Text widget, simply create an instance with the desired typography style and provide the necessary parameters. For example:

```dart
M3Text.displayLarge(
text: 'Welcome',
textAlign: TextAlign.center,
)
```



| Light                                                                                               | Dark                                                                                                     |
| --------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Typography.png" width="500"/>  | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Typography_dark.png" width="500"/> |

##  2. **M3Buttons**

#### **Constructors**

- M3Button

```dart
M3Button, M3Button.filled, M3Button.filledTonal,
M3Button.filledTertiary, M3Button.outline, M3Button.text
```

- M3ButtonWithIcon

```dart
M3ButtonWithIcon, M3ButtonWithIcon.filled
M3ButtonWithIcon.filledTonal, M3ButtonWithIcon.outline
M3ButtonWithIcon.text
```

- M3ErrorButton

```dart
M3ErrorButton, M3ErrorButton.filled
M3ErrorButton.filledTonal, M3ErrorButton.outline
M3ErrorButton.text
```

- M3IconButton

```dart
M3IconButton, M3IconButton.filled
M3IconButton.filledTonal, M3IconButton.outline
M3IconButton.text
```

#### Usage

- M3 Button

```dart
M3Button(
  text: 'Click me',
  onPressed: () {
    // Handle button press
  },
)
```

- M3ButtonWithIcon

```dart
M3ButtonWithIcon(
  text: 'Submit',
  icon: Icons.check,
  onPressed: () {
    // Handle button press
  },
)
```

- M3ErrorButton

```dart
M3ErrorButton(
  text: 'This is error button',
  onPressed: () {
    // Handle button press
  },
)
```

- M3IconButton

```dart
M3IconButton(
      icon: Icons.add,
      onPressed: () {
        // Handle button press
      },
    ),

```

| Light                                                                                                                                                                                                                           | Dark                                                                                                     |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| -------------------------------------------------------------------------------------------------------- |
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Buttons_1.png" width="200"/>,<img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Buttons_2.png" width="200"/> | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Buttons_1_dark.png" width="200"/>,<img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Buttons_2_dark.png" width="200"/> |





## **3. M3Badge**

#### **Constructors**

```dart
M3Badge
```

- key (optional): An identifier for the widget. Use it to provide a key to this widget if necessary.
- child (optional): The child widget to display within the badge. Either child or iconData must be provided.
- count (required): The count value to display within the badge.
- iconData (optional): The icon data to display within the badge. Either child or iconData must be provided.

#### **Usage**

- Displaying a badge with a child widget:

```dart
M3Badge(
  count: 10,
  child: Text('New'),
)
```

- Displaying a badge with an icon:
```dart
M3Badge(
  count: 5,
  iconData: Icons.notifications,
)
```

| Light                                                                                               | Dark                                                                                                     |
| --------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Badge.png" width="500"/>  | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Badge_dark.png" width="500"/> |





## **4. M3CheckBox**

#### **Constructors**

```dart
M3CheckBox
```

- key (optional): An identifier for the widget. Use it to provide a key to this widget if necessary.
- value (required): The current value of the checkbox.
- onChanged (optional): A callback function that is called when the checkbox value is changed by the user. It takes a single argument of type bool that represents the new value of the checkbox.
- isError (optional): A flag indicating whether the checkbox should be displayed in an error state.
- tristate (optional): A flag indicating whether the checkbox should support a third indeterminate state.

#### **Usage**

- Basic usage:

```dart
M3CheckBox(
    value: true,
    onChanged: (newValue) {
    // Handle the checkbox value change here
    },
)
```

- Checkbox with error state:

```dart
M3CheckBox(
    value: false,
    isError: true,
    onChanged: (newValue) {
    // Handle the checkbox value change here
    },
)
```

- Checkbox with tristate support:

```dart
M3CheckBox(
    value: null,
    tristate: true,
    onChanged: (newValue) {
    // Handle the checkbox value change here
    },
)
```


| Light                                                                                               | Dark                                                                                                                |
| --------------------------------------------------------------------------------------------------- |---------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_CheckBox.png" width="500"/>  | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_CheckBox_dark.png" width="500"/> |



## **5. M3 Chips**

#### **Constructors**

```dart
M3InputChip, M3InputChip.filled, M3InputChip.filledTonal
M3FilterChip, M3FilterChip.filled, M3FilterChip.filledTonal
```

- leading (optional): A widget to display as the leading icon in the chip.
- deleteIcon (optional): A widget to display as the delete icon in the chip.
- onDeleted (optional): A callback function that is called when the delete icon is pressed. Use it to handle chip deletion.
- isEnable (optional): A flag indicating whether the chip is enabled or disabled. Disabled chips cannot be interacted with.
- backgroundColor (optional): The background color of the chip.
- foregroundColor (optional): The foreground color of the chip, which affects the text and icon colors.
- onPressed (optional): A callback function that is called when the chip is pressed. Use it to handle chip press events.

#### **Usage**

- M3InputChip:

```dart
M3InputChip(
    text: 'M3InputChip',
    onPressed: () {
          
    },
),
```

- M3FilterChip:

```dart
M3FilterChip(
    text: 'M3FilterChip',
    selected: true,
    onPressed: () {
          
    },
),
```


| Light                                                                                                                                                                                                                        | Dark                                                                                                                                                                                                                                   |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Chips_1.png" width="500"/> ,<img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Chips_2.png" width="500"/> | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Chips_1_dark.png" width="500"/>, <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Chips_2_dark.png" width="500"/> |

