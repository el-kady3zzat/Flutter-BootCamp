## Updates: Localization Implementation Using `easy_localization`

### Overview
This update introduces **localization** to the app using the `easy_localization` package. It allows the app to support multiple languages, enhancing usability for a broader audience. The app now supports **English** and **Arabic**, with additional languages easily integrable.

---

### Key Features and Changes

#### 1. **Localization Setup**
   - Configured the app to use the `easy_localization` package for multi-language support.
   - Added the following locales:
     - English: `Locale('en')`
     - Arabic: `Locale('ar')`
   - Set up a fallback locale: `Locale('en')` ensures English is used as the default if the user's language is unsupported.
   - Translations are stored in `assets/translations`.

   **Main Code in `main.dart`:**
   ```dart
   runApp(
     EasyLocalization(
       supportedLocales: const [Locale('en'), Locale('ar')],
       path: 'assets/translations',
       fallbackLocale: const Locale('en'),
       child: const MyApp(),
     ),
   );
  ```

### Output
<p align="center"><img src="https://github.com/user-attachments/assets/4e2db253-ea27-4ef3-b15f-d4fdea75a81d"  alt="Output1" height="844" width="431.38"/></p>
<p align="center"><img src="https://github.com/user-attachments/assets/b91ea133-c2ff-44a8-8810-0e11f4f41084"  alt="Output2" height="844" width="431.38"/></p>

**Video**

https://github.com/user-attachments/assets/eb8a477e-6410-4430-9d56-4172362d8c35