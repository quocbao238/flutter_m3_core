# 📦 flutter_m3_core 📦

- Simplifies theme management by providing effortless switching between light, dark, or custom themes. This feature allows you to create visually striking apps with ease.

- The package seamlessly integrates Material 3 components into your app's UI, enabling you to build sleek and intuitive interfaces. This integration ensures a seamless user experience that aligns with the latest design standards.

- With customization options, you can easily tailor the appearance and behavior of Material 3 components to match your app's unique requirements. This level of customization guarantees a cohesive and consistent user experience, enhancing the overall quality of your app.

# 🧪  Download for testing

| Platform      | Package/Installation Method                                                                                                                                                                                                                 |
|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Web           | [<img width='220' alt='Web View' src='https://raw.githubusercontent.com/quocbao238/flutter_m3_core/main/images/view_in_web.png'/>][web-link] |
| Android       | [<img width='220' alt='Android Download' src='https://user-images.githubusercontent.com/114044633/223920025-83687de0-e463-4c5d-8122-e06e4bb7d40c.png'/>][android-link]                                                                      
| MacOS         | [<img width='220' alt='MacOS Download' src='https://reachify.io/wp-content/uploads/2018/09/mac-download-button-1.png'/>][mac-link]                                                                                                          


# 💊 Installation
Add the following to your pubspec.yaml file:
```yaml
dependencies:
  flutter_m3_core:
    git: 
      url: https://github.com/quocbao238/flutter_m3_core
      ref: v1.0.1
    
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
    return const M3ViewLayout(
      mobile: MobileView(),
      tablet: TabletView(),
      desktop: DesktopView(),
    );
  }
}
```

# 👨‍💻 Material 3 Components

- This package have many components principle with Material 3 design like Buttons,CheckBox,Slider,Typography,Progress,DatePicker....
- Let's try it

## **1. M3 Text**

#### **Constructors**

```dart
M3Text.displayLarge, M3Text.displayMedium, M3Text.displaySmall, M3Text.headlineLarge,
M3Text.headlineMedium, M3Text.headlineSmall, M3Text.titleLarge, M3Text.titleMedium, 
M3Text.titleSmall, M3Text.labelLarge, M3Text.labelMedium, M3Text.labelSmall, 
M3Text.bodyLarge, M3Text.bodyMedium, M3Text.bodySmall
```
- **`text`** (required): A string representing the text to be displayed.
- **`textAlign`** (optional): An enum value representing the horizontal alignment of the text. It defaults to TextAlign.center.
- **`fontWeight`** (optional): A FontWeight enum value representing the weight of the font used to display the text. It defaults to FontWeight.normal.
- **`color`** (optional): A Color value representing the color of the text. It defaults to the color defined in the M3TextStyle enum for the specific style of the M3Text widget.
- **`maxLines`** (optional): An integer representing the maximum number of lines to be displayed. If not specified, it defaults to displaying all available lines.
- **`overflow`** (optional): An enum value representing how to handle overflow when the text exceeds the available space. It defaults to TextOverflow.clip.
- **`isFlexible`** (optional): A boolean value indicating whether the text should be able to wrap to multiple lines if necessary. It defaults to true.


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
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Typography.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Typography_dark.png"/>

##  2. **M3 Buttons**

#### **Constructors**

- **M3Button**

    ```dart
    M3Button, M3Button.filled, M3Button.filledTonal,
    M3Button.filledTertiary, M3Button.outline, M3Button.text
    ```

  - **`text`**: A string that represents the text displayed on the button. Either text or child must not be null.
  - **`child`**: A widget that represents the child element displayed on the button. Either text or child must not be null.
  - **`onPressed`**: A callback function that is called when the button is pressed.
  - **`backgroundColor`**: A Color object that determines the background color of the button.
  - **`foregroundColor`**: A Color object that determines the text and icon color of the button.
  - **`fixedSize`**: A Size object that determines the size of the button. It can be used to create fixed-size buttons. If not specified, the button will adjust to its content.


- **M3ButtonWithIcon**

    ```dart
    M3ButtonWithIcon, M3ButtonWithIcon.filled
    M3ButtonWithIcon.filledTonal, M3ButtonWithIcon.outline
    M3ButtonWithIcon.text
    ```

  - **`text`**: A required String parameter that specifies the text to be displayed on the button.
  - **`icon`**: A required IconData parameter that specifies the icon to be displayed on the button.
  - **`onPressed`**: An optional VoidCallback parameter that specifies the function to be called when the button is pressed.
  - **`backgroundColor`**: An optional Color parameter that specifies the background color of the button.
  - **`foregroundColor`**: An optional Color parameter that specifies the text and icon color of the button.
  - **`fixedSize`**: An optional Size parameter that specifies the fixed size of the button.
  - **`reverseIcon`**: An optional bool parameter that specifies whether the icon should be reversed (i.e. displayed on the right instead of the left).


- **M3ErrorButton**

    ```dart
    M3ErrorButton, M3ErrorButton.filled
    M3ErrorButton.filledTonal, M3ErrorButton.outline
    M3ErrorButton.text
    ```

  - **`text`** (optional): A String representing the button's label text.
  - **`child`** (optional): A Widget that can be used instead of text to define the button's child widget.
  - **`onPressed`** (optional): A VoidCallback that is called when the button is pressed.
  - **`backgroundColor`** (optional): A Color that defines the background color of the button.
  - **`foregroundColor`** (optional): A Color that defines the text color of the button.
  - **`fixedSize`** (optional): A Size that defines the fixed size of the button.
  - **`isFlexible`** (optional): A bool that defines whether the button can be resized to fit its parent widget.


- **M3IconButton**

    ```dart
    M3IconButton, M3IconButton.filled
    M3IconButton.filledTonal, M3IconButton.outline
    M3IconButton.text
    ```

  - **`icon`** (required):  parameter of type IconData, representing the icon to be displayed in the button.
  - **`onPressed`** (optional):  parameter of type VoidCallback, representing the function to be called when the button is pressed.

#### **Usage**

- **M3 Button**

    ```dart
    M3Button(
      text: 'Click me',
      onPressed: () {
        // Handle button press
      },
    )
    ```

- **M3ButtonWithIcon**

    ```dart
    M3ButtonWithIcon(
      text: 'Submit',
      icon: Icons.check,
      onPressed: () {
        // Handle button press
      },
    )
    ```

- **M3ErrorButton**

    ```dart
    M3ErrorButton(
      text: 'This is error button',
      onPressed: () {
        // Handle button press
      },
    )
    ```

- **M3IconButton**

    ```dart
    M3IconButton(
          icon: Icons.add,
          onPressed: () {
            // Handle button press
          },
        ),
    ```

| Light                                                                                                                                                                                                                           | Dark                                                                                                                                                                                                                                      |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Buttons_1.png" width="500"/><br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Buttons_2.png" width="500"/> | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Buttons_1_dark.png" width="500"/> <br/><br/><img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Buttons_2_dark.png" width="500"/> |
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Buttons.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Buttons_dark.png"/>




## **3. M3 Badge**

#### **Constructors**

```dart
M3Badge
```

- **`key`** (optional): An identifier for the widget. Use it to provide a key to this widget if necessary.
- **`child`** (optional): The child widget to display within the badge. Either child or iconData must be provided.
- **`count`** (required): The count value to display within the badge.
- **`iconData`** (optional): The icon data to display within the badge. Either child or iconData must be provided.

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
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Badge.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Badge_dark.png"/>




## **4. M3 CheckBox**

#### **Constructors**

```dart
M3CheckBox
```

- **`key`** (optional): An identifier for the widget. Use it to provide a key to this widget if necessary.
- **`value`** (required): The current value of the checkbox.
- **`onChanged`** (optional): A callback function that is called when the checkbox value is changed by the user. It takes a single argument of type bool that represents the new value of the checkbox.
- **`isError`** (optional): A flag indicating whether the checkbox should be displayed in an error state.
- **`tristate`** (optional): A flag indicating whether the checkbox should support a third indeterminate state.

#### **Usage**

- **Basic usage:**

    ```dart
    M3CheckBox(
        value: true,
        onChanged: (newValue) {
        // Handle the checkbox value change here
        },
    )
    ```

- **Checkbox with error state**:

    ```dart
    M3CheckBox(
        value: false,
        isError: true,
        onChanged: (newValue) {
        // Handle the checkbox value change here
        },
    )
    ```

- **Checkbox with tristate support:**

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
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_CheckBox.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_CheckBox_dark.png"/>


## **5. M3 Chips**

#### **Constructors**

- **M3InputChip**
    ```dart
    M3InputChip, M3InputChip.filled, M3InputChip.filledTonal
    M3FilterChip, M3FilterChip.filled, M3FilterChip.filledTonal
    ```

  - **`leading`** (optional): A widget to display as the leading icon in the chip.
  - **`deleteIcon`** (optional): A widget to display as the delete icon in the chip.
  - **`onDeleted`** (optional): A callback function that is called when the delete icon is pressed. Use it to handle chip deletion.
  - **`onPressed`** (optional): A callback function that is called when the chip is pressed. Use it to handle chip press events.
  - **`isEnable`** (optional): A flag indicating whether the chip is enabled or disabled. Disabled chips cannot be interacted with.
  - **`backgroundColor`** (optional): The background color of the chip.
  - **`foregroundColor`** (optional): The foreground color of the chip, which affects the text and icon colors.


- **M3FilterChip**

    ```dart
    M3FilterChip, M3FilterChip.filled, M3FilterChip.filledTonal
    ```

  - **`text`**: the text label to display inside the chip
  - **`selected`**: a boolean value indicating whether the chip is currently selected or not
  - **`onSelected`**: a callback function that is called when the chip is selected or unselected
  - **`isEnabled`**: a boolean value indicating whether the chip is enabled or not
  - **`backgroundColor`**: the background color of the chip
  - **`foregroundColor`**: the foreground (text) color of the chip
  - **`leadingIcon`**: an optional icon to display at the beginning of the chip label

#### **Usage**

- **M3InputChip**:

    ```dart
    M3InputChip(
        text: 'M3InputChip',
        onPressed: () {
              
        },
    ),
    ```

- **M3FilterChip**:

    ```dart
    M3FilterChip(
        text: 'M3FilterChip',
        selected: true,
        onPressed: () {
              
        },
    ),
    ```
| Light                                                                                                                                                                                                                           | Dark                                                                                                                                                                                                                                        |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Chips_1.png" width="500"/>  <br/><br/><img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Chips_2.png" width="500"/> | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Chips_1_dark.png" width="500"/> <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Chips_2_dark.png" width="500"/> |
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Chips.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Chips_dark.png"/>


## **6. M3 Dialogs**

#### **Constructors**

- **M3Dialog.showBasicDialog**
    ```dart
    M3Dialog.showDialog
    ```
  - **`context`**: A required parameter of type BuildContext that represents the build context of the widget tree.
  - **`title`**: An optional parameter of type String that represents the title of the dialog.
  - **`content`**: An optional parameter of type String that represents the content of the dialog.
  - **`actions`**: An optional parameter of type List<Widget> that represents the actions that can be performed in the dialog.
  - **`child`**: An optional parameter of type Widget that represents the child widget of the dialog.


- **M3Dialog.showIconsDialog**
    ```dart
    M3Dialog.showIconsDialog
    ```
  - **`icon`**: A required parameter of type IconData that represents the icon to be displayed in the dialog.
  - **`context`**: A required parameter of type BuildContext that represents the build context of the widget tree.
  - **`title`**: An optional parameter of type String that represents the title of the dialog.
  - **`content`**: An optional parameter of type String that represents the content of the dialog.
  - **`actions`**: An optional parameter of type List<Widget> that represents the actions that can be performed in the dialog.
  - **`child`**: An optional parameter of type Widget that represents the child widget of the dialog.

#### **Usage**

- **M3 Basic Dialog**:

    ```dart
    M3Dialog.showBasicDialog(
        context: context,
        title: DialogPalette.title,
        content: DialogPalette.content,
        actions: actions,
  );
    ```

- **M3 Dialog With Icon**:

    ```dart
    M3Dialog.showIconsDialog(
        context: context,
        title: DialogPalette.title,
        content: DialogPalette.content,
        actions: actions,
        icon: Icons.info_outline_rounded,
  );

    ```

  

| Light                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Dark                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_dialog.png" width="500"/>  <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_dialog_1.png" width="500"/>  <br/><br/><img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_dialog_2.png" width="500"/><br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_dialog_3.png" width="500"/>  <br/><br/><img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_dialog_4.png" width="500"/> | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_dialog_dark.png" width="500"/>  <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_dialog_dark_1.png" width="500"/>  <br/><br/><img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_dialog_dark_2.png" width="500"/><br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_dialog_dark_3.png" width="500"/>  <br/><br/><img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_dialog_dark_4.png" width="500"/> |
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Dialogs.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Dialogs_dark.png"/>



## **7. M3 Floating Action Button**

#### **Constructors**

```dart
M3FloatingActionButton.surface(), M3FloatingActionButton.primary()
M3FloatingActionButton.secondary(), M3FloatingActionButton.tertiary()
```

- **`iconData`**: The icon to display on the button.
- **`label`**: The label to display on the button (only available for M3FabSize.extended).
- **`onPressed`**: The callback function to be called when the button is pressed.
- **`m3FabSize`**: The size of the button (M3FabSize.small, M3FabSize.normal, M3FabSize.large, or M3FabSize.extended).

#### **Usage**

- **A small floating action button with a surface background color**:

    ```dart
    M3FloatingActionButton.surface(
      onPressed: () {},
      iconData: Icons.add,
      m3FabSize: M3FabSize.small,
    )
    ```

- **A normal floating action button with a primary background color and a label**:

    ```dart
    M3FloatingActionButton.primary(
      onPressed: () {},
      iconData: Icons.add,
      label: 'Add',
    )
    ```

- **A large floating action button with a secondary background color**:

  ```dart
  M3FloatingActionButton.secondary(
    onPressed: () {},
    iconData: Icons.edit,
    m3FabSize: M3FabSize.large,
  )
  ```

- **An extended floating action button with a tertiary background color and a label**:

  ```dart
  M3FloatingActionButton.tertiary(
    onPressed: () {},
    iconData: Icons.share,
    label: 'Share',
    m3FabSize: M3FabSize.extended,
  )
  ```





| Light                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Dark                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_FAB.png" width="500"/>  <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_FAB_1.png" width="500"/> | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_FAB_dark.png" width="500"/>  <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_FAB_1_dark.png" width="500"/> |
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Fab.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Fab_dark.png"/>


## **8. M3 DatePicker**

#### **Constructors**

- **M3DatePicker.showModalDatePicker**

  ```dart
  M3DatePicker.showModalDatePicker(
    context,
    onDateSelected: (DateTime selectedDate) {
      // Handle the selected date
    },
    initialDate: DateTime.now(),
  );
  ```

  -   **``ctx``** (required): The BuildContext of the current widget.
  -   **``onDateSelected``**(required): A function that will be called when a date is selected.
  -   **``initialDate``**(required): The initial date to display in the date picker.
  -   **`firstDate`** (optional): The earliest date that can be selected.
  -   **`lastDate`** (optional): The latest date that can be selected.
  -   **`helpText`** (optional): The text to display as the help text at the top of the date picker.
  -   **`cancelText`** (optional): The text to display for the cancel button.
  -   **`confirmText`** (optional): The text to display for the confirm button.
  -   **`locale`** (optional): The locale used to format the date picker's text and labels.
  -   **`errorFormatText`** (optional): The error message to display when the input date is not in the expected format.
  -   **`errorInvalidText`** (optional): The error message to display when the selected date is invalid.
  -   **`fieldHintText`** (optional): The hint text to display in the date picker's input field.
  -   **`fieldLabelText`** (optional): The label text to display for the date picker's input field.
  -   **`use24HourDials`** (optional): Whether to use a 24-hour format for the time picker.
  -   **`initialEntryMode`** (optional): The initial entry mode of the date picker.
  -   **`initialDatePickerMode`** (optional): The initial display mode of the date picker.


- **M3DatePicker.showModalDateRangePicker**

  ```dart
  M3DatePicker.showModalDateRangePicker(
    context,
    onDateSelected: (DateTimeRange selectedDateRange) {
    // Handle the selected date range
    },
    initialDateRange: DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(days: 7)),
      ),
    );
  );
  ```

  - **`ctx`** (required): The BuildContext of the current widget.
  - **`onDateSelected`** (required): A function that will be called when a date range is selected.
  - **`initialDateRange`** (optional): The initial date range to display in the date range picker.
  - **`initialEntryMode`** (optional): The initial entry mode of the date range picker.
  - **`helpText`** (optional): The text to display as the help text at the top of the date range picker.
  - **`cancelText`** (optional): The text to display for the cancel button.
  - **`confirmText`** (optional): The text to display for the confirm button.
  - **`saveText`** (optional): The text to display for the save button.
  - **`errorFormatText`** (optional): The error message to display when the input date range is not in the expected format.
  - **`errorInvalidText`** (optional): The error message to display when the selected date range is invalid.
  - **`errorInvalidRangeText`** (optional): The error message to display when the selected date range is not within the allowed range.
  - **`fieldStartHintText`** (optional): The hint text to display in the start date field of the date range picker.
  - **`fieldEndHintText`** (optional): The hint text to display in the end date field of the date range picker.
  - **`fieldStartLabelText`** (optional): The label text to display for the start date field of the date range picker.
  - **`fieldEndLabelText`** (optional): The label text to display for the end date field of the date range picker.
  - **`firstDate`** (optional): The earliest date that can be selected.
  - **`lastDate`** (optional): The latest date that can be selected.
  - **`use24HourDials`** (optional): Whether to use a 24-hour format for the time picker.


- **M3DatePicker.showModalTimePicker**

  ```dart
  M3DatePicker.showModalTimePicker(
    context,
    onDateSelected: (DateTime selectedTime) {
    // Handle the selected time
    },
    initialTime: TimeOfDay.now(),
    );
  ```

  - **`ctx`** (required): The BuildContext of the current widget.
  - **`onDateSelected`** (required): A function that will be called when a time is selected.
  - **`initialTime`** (required): The initial time to display in the time picker.
  - **`cancelText`** (optional): The text to display for the cancel button.
  - **`confirmText`** (optional): The text to display for the confirm button.
  - **`helpText`** (optional): The text to display as the help text at the top of the time picker.
  - **`errorInvalidText`** (optional): The error message to display when the selected time is invalid.
  - **`hourLabelText`** (optional): The label text to display for the hour input field in the time picker.
  - **`use24HourDials`** (optional): Whether to use a 24-hour format for the time picker.
  - **`initialEntryMode`** (optional): The initial entry mode of the time picker.
  - **`minuteLabelText`** (optional): The label text to display for the minute input field in the time picker.


  
#### **Usage**

- **Day Picker Calendar Only**:

    ```dart
    final result = await M3DatePicker.showModalDatePicker(context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      onDateSelected: _onChangeDateTime,
      initialDate: dateTime);
      if (result != null) {
       _onChangeDateTime(result);
      }
    ```

- **M3 Picker Input Only**:

    ```dart
    final result = await M3DatePicker.showModalDatePicker(context,
      initialEntryMode: DatePickerEntryMode.inputOnly,
      use24HourDials: use24HourFormat,
      onDateSelected: _onChangeDateTime,
      initialDate: dateTime);
      if (result != null) {
        _onChangeDateTime(result);
      }
    ```

- **M3 Time Picker Dial**:

  ```dart
  final result = await M3DatePicker.showModalTimePicker(context,
    use24HourDials: use24HourFormat,
    initialTime: TimeOfDay(
    hour: dateTime.hour, minute: dateTime.minute),
    onDateSelected: _onChangeDateTime);
    if (result != null) {
      final newDateTime = DateTime(dateTime.year, dateTime.month,
      dateTime.day, result.hour, result.minute);
      _onChangeDateTime(newDateTime);
    }
  ```

- **M3 Time Picker Input**:

  ```dart
  final result = await M3DatePicker.showModalTimePicker(
     context,
    initialEntryMode: TimePickerEntryMode.inputOnly,
    use24HourDials: use24HourFormat,
    initialTime: TimeOfDay(
      hour: dateTime.hour, minute: dateTime.minute),
    onDateSelected: _onChangeDateTime);
    if (result != null) {
      final newDateTime = DateTime(dateTime.year, dateTime.month,
      dateTime.day, result.hour, result.minute);
      _onChangeDateTime(newDateTime);
    }
  ```

| Light                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Dark                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_DatePicker.png" width="500"/>  <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_DatePicker_1.png" width="500"/> <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_DatePicker_2.png" width="500"/>  <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_DatePicker_3.png" width="500"/> <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_DatePicker_4.png" width="500"/>  <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_DatePicker_5.png" width="500"/> | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_DatePicker_dark.png" width="500"/>  <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_DatePicker_dark_1.png" width="500"/> <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_DatePicker_dark_2.png" width="500"/>  <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_DatePicker_dark_3.png" width="500"/> <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_DatePicker_dark_4.png" width="500"/>  <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_DatePicker_dark_5.png" width="500"/> |
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_DatePicker_1.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_DatePicker_1_dark.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_DatePicker_2.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_DatePicker_2_dark.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_DatePicker_3.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_DatePicker_3_dark.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_DatePicker_4.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_DatePicker_4_dark.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_DatePicker_5.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_DatePicker_5_dark.png"/>


## **9. M3 ProgressIndicator**

#### **Constructors**

- **M3LinearProgressIndicator**

  ```dart
  M3LinearProgressIndicator.primary(), 
  M3LinearProgressIndicator.secondary()
  M3LinearProgressIndicator.tertiary()
  ```

  - **`value`** (optional): The progress value (between 0.0 and 1.0). Defaults to 0.0.
  - **`backgroundColor`** (optional): The background color of the progress indicator. Defaults to null.
  - **`color`** (optional): The color of the progress indicator. Defaults to null.
  - **`enable`** (optional): Set to true to enable the progress indicator (default), or false to disable it.
  - **`valueColor`** (optional): The color of the progress indicator's value. Defaults to null.
  - **`minHeight`** (optional): The minimum height of the progress indicator. Defaults to null.
  - **`semanticsLabel`** (optional): The semantic label of the progress indicator for accessibility. Defaults to null.
  - **`semanticsValue`** (optional): The semantic value of the progress indicator for accessibility. Defaults to null.
  - **`borderRadius`** (optional): The border radius of the progress indicator. Defaults to null.


- **M3CircularProgressIndicator**

  ```dart
  M3CircularProgressIndicator.primary(),
  M3CircularProgressIndicator.secondary()
  M3CircularProgressIndicator.tertiary()
  ```

  - **`enable`** (optional): Set to true to enable the progress indicator (default), or false to disable it.
  - **`value`** (optional): The progress value (between 0.0 and 1.0). Defaults to 0.0.
  - **`backgroundColor`** (optional): The background color of the progress indicator. Defaults to null.
  - **`color`** (optional): The color of the progress indicator. Defaults to null.
  - **`valueColor`** (optional): The color of the progress indicator's value. Defaults to null.
  - **`strokeWidth`** (optional): The stroke width of the progress indicator. Defaults to null.
  - **`semanticsLabel`** (optional): The semantic label of the progress indicator for accessibility. Defaults to null.
  - **`semanticsValue`** (optional): The semantic value of the progress indicator for accessibility. Defaults to null.
  - **`strokeCap`** (optional): The stroke cap of the progress indicator. Defaults to null.


- **M3CircularProgressIndicatorAdaptive**

  ```dart
  M3CircularProgressIndicatorAdaptive.primary(),
  M3CircularProgressIndicatorAdaptive.secondary()
  M3CircularProgressIndicatorAdaptive.tertiary()
  ```

  - **`enable`** (optional): Set to true to enable the progress indicator (default), or false to disable it.
  - **`key`** (optional): Controls the widget's identity.
  - **`value`** (optional): The progress value (between 0.0 and 1.0). Defaults to 0.0.
  - **`backgroundColor`** (optional): The background color of the progress indicator. Defaults to null.
  - **`color`** (optional): The color of the progress indicator. Defaults to null.
  - **`valueColor`** (optional): The color of the progress indicator's value. Defaults to null.
  - **`strokeWidth`** (optional): The stroke width of the progress indicator. Defaults to null.
  - **`semanticsLabel`** (optional): The semantic label of the progress indicator for accessibility. Defaults to null.
  - **`semanticsValue`** (optional): The semantic value of the progress indicator for accessibility. Defaults to null.
  - **`strokeCap`** (optional): The stroke cap of the progress indicator. Defaults to null.

  
| Light                                                                                                                                                                                                                                       | Dark                                                                                                                                                                                                                                                  |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Progress.png" width="500"/>  <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Progress_1.png" width="500"/> | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Progress_dark.png" width="500"/>  <br/><br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Progress_dark_1.png" width="500"/> |

  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Progress.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Progress_dark.png"/>


## **10. M3 Slider**

#### **Constructors**

- **M3LinearProgressIndicator**

  ```dart
  M3Slider,
  M3Slider.primary(), 
  M3Slider.secondary()
  M3Slider.tertiary()
  ```
  - **`value`**: The current value of the slider.
  - **`min`**: The minimum value of the slider.
  - **`max`**: The maximum value of the slider.
  - **`onChanged`**: A callback function that is called when the value of the slider changes.



#### **Usage**

```dart
M3Slider(
  value: value, // The current value of the slider
  min: 0.0, // The minimum value of the slider
  max: 1.0, // The maximum value of the slider
  onChanged: (double value) {
    // Callback function to handle value changes
    // Update the value and perform any desired actions
  },
  // Additional customization properties
)
```

| Light                                                                                                                                                                                                                                      | Dark                                                                                                                                                                                                                                                 |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Slider.png" width="500"/>  | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Slider_dark.png" width="500"/> |
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Slider.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Slider_dark.png"/>


## **11. M3 Switch**

#### **Constructors**

- **M3LinearProgressIndicator**

  ```dart
  M3Switch()
  M3Switch.primary()
  M3Switch.adaptive()
  M3Switch.tertiary()
  ```
  
  - **`key`** (optional): Controls the widget's identity.
  - **`value`**: The current value of the switch.
  - **`onChanged`**: A callback function that is called when the value of the switch changes. The function should take a bool parameter representing the new value.
  - **`selectedIcon`** (optional): The icon to display when the switch is in the selected state.
  -  **`normalIcon`** (optional): The icon to display when the switch is in the normal state



#### **Usage**

```dart
M3Switch(
  value: value, // The current value of the switch
  onChanged: (bool value) {
  // Callback function to handle value changes
  // Update the value and perform any desired actions
  },
  // Additional customization properties
)
```

| Light                                                                                                                                                                                                                                      | Dark                                                                                                              |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Switch.png" width="500"/>  | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Switch_dark.png" width="500"/> |
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Switch.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Switch_dark.png"/>


## **12. M3 Input**

#### **Constructors**

  ```dart
  M3Input()
  M3Input.outline()
  ```

  - **`controller`** (optional): The TextEditingController for the input field.
  - **`enabled`** (optional): Whether the input field is enabled or disabled. If not provided, it defaults to true.
  - **`disableBackground`** (optional): Whether to disable the background of the input field. If true, the background will be transparent. If not provided, it defaults to false.
  - **`labelText`** (optional): The label text for the input field.
  - **`filled`** (optional): Whether to display a filled background for the input field. If not provided, it defaults to false.
  - **`supportingText`** (optional): Additional supporting text for the input field.
  - **`prefixWidget`** (optional): A widget to display as a prefix for the input field.
  - **`suffixWidget`** (optional): A widget to display as a suffix for the input field.
  - **`prefixIconData`** (optional): The icon data for the prefix icon.
  - **`suffixIconData`** (optional): The icon data for the suffix icon.
  - **`errorText`** (optional): The error text to display for the input field.



#### **Usage**


- **M3Input**
  ```dart
  M3Input(
    controller: TextEditingController(text: 'Input'),
    labelText: 'Label',
    supportingText: 'Supporting Text',
  )
  ```

- **M3Input.outline**
  ```dart
    M3Input.outline(
        controller: TextEditingController(text: 'Input'),
        labelText: 'Label',
        supportingText: 'Supporting Text',
    )
  ```
  
| Light                                                                                                                                                                                                                                                                                                                                                           | Dark                                                                                                                                                                                                                                                                                                                                                                           |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Input.png" width="500"/> <br/> <br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Input_1.png" width="500"/> <br/> <br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Input_2.png" width="500"/> | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Input_dark.png" width="500"/> <br/> <br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Input_dark_2.png" width="500"/> <br/> <br/> <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/m3_Input_dark_3.png" width="500"/> |
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Input.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Input_dark.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Input_1.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Input_1_dark.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Input_2.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/m3_Input_2_dark.png"/>


## **12. Segmented**

| Light                                                                                                                                                                                                                                                                                                                                                           | Dark                                                                                                                                                                                                                                                                                                                                                                           |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/Segmented.png" width="500"/> | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/Segmented_dark.png" width="500"/>  |

  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/Segmented.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/Segmented_dark.png"/>

## **12. Snack Bar**

| Light                                                                                                                                                                                                                                                                                                                                                           | Dark                                                                                                                                                                                                                                                                                                                                                                           |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/SnackBar.png" width="500"/>  | <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/mobile/SnackBar_dark.png" width="500"/>  |
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/SnackBar.png"/>
  <img src="https://github.com/quocbao238/flutter_m3_core/blob/main/images/tablet/SnackBar_dark.png"/>

<!-- Variables/Text References -->
[win32-link]: win32-link
[android-link]: https://raw.githubusercontent.com/quocbao238/flutter_m3_core/main/download/app-profile.apk
[deb-link]: deb-link
[web-link]: https://quocbao238.github.io/flutter_m3_core_webview/#/
[mac-link]: https://raw.githubusercontent.com/quocbao238/flutter_m3_core/main/download/flutter_m3_core.dmg
