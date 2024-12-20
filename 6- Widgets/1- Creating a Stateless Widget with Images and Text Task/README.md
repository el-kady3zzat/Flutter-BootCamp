## Project Overview

This Flutter project demonstrates a basic application structure with responsive design using the `SizeConfig` utility to adapt to different screen sizes and orientations.

### Main Components

1. **`main.dart`**:  
   - Initializes the app and sets up global configurations such as screen size adaptation using `SizeConfig`.  
   - The `MaterialApp` widget is used to define the app's theme, title, and initial screen (`HomePage`).
   - Sets the app's primary color and font.

2. **`size_config.dart`**:  
   - This utility class calculates the screen's width, height, and orientation (portrait or landscape).  
   - It defines a `defaultSize` to help scale UI elements proportionally across different devices.

3. **`home_page.dart`**:  
   - Defines the structure of the home page, which includes an `AppBar` and a body section.  
   - The body displays two images (one from local assets and the other from a network source) with a description below.
   - The layout is designed to be responsive with padding and vertical spacing between elements.

### Key Features
- **Responsive UI**: The app adapts its UI layout based on the screen size and orientation using the `SizeConfig` class.
- **Image Display**: The home page displays two images, one from local assets and another fetched from the web.
- **Customizable Text**: A text widget is added below the images for description.

### Setup
1. Run the app using `flutter run`.
2. Ensure the assets (like images) are correctly added in `pubspec.yaml` for local usage.

### Output
| <p align="center"><img src="https://github.com/user-attachments/assets/a9edb2b6-05ca-4328-ba51-3f119c6f3dde"  alt="first_flutter_project_portrait" height="844" width="431.38"/></p> | <p align="center"><img src="https://github.com/user-attachments/assets/79bddfa4-01c5-4bf2-837e-dd88e3a6527c" alt="first_flutter_project_landscape"/></p> |

This project is a basic demonstration of Flutter's layout and screen size management features.
