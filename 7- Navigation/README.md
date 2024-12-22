## Signup Page Code Explanation

### Overview
This code implements a **Signup Page** using Flutter. The page provides a user-friendly interface for creating a new account. It includes validation for input fields, feedback via dialogs and snackbars, and responsive design.

---

### Features

1. **Form-Based Signup**
   - Utilizes the `Form` widget with individual `TextFormField` components for:
     - Name
     - Email
     - Password
     - Password Confirmation

2. **Validation**
   - Ensures all fields are correctly filled before submission.
   - Verifies that the "Password" and "Confirm Password" fields match.

3. **Interactive Feedback**
   - Displays a **Dialog** when the signup process succeeds, welcoming the user.
   - Shows a **Snackbar** if passwords do not match.

4. **Custom Widgets**
   - Integrates reusable widgets:
     - `SnaporaLogo` for displaying the app logo.
     - `SnaporaTextField` for consistent styling of input fields.
     - `SnaporaButton` for action buttons.

5. **Responsive Design**
   - Adapts UI elements using the `SizeConfig` utility for consistent spacing and sizing across devices.

---

### Components

#### 1. **Input Fields**
   - Four `SnaporaTextField` widgets with controllers and `GlobalKey` instances for managing their states.
   - Hints and icons make the input fields intuitive.

#### 2. **Signup Button**
   - The `SnaporaButton` triggers validation and navigates to another page upon successful signup.
   - Validates form input and provides user feedback:
     - **Success**: Displays a dialog with a personalized welcome message.
     - **Failure**: Shows a snackbar indicating mismatched passwords.

#### 3. **Dialogs and Snackbars**
   - **Dialog**: Presented when signup succeeds, welcoming the user by their first name.
   - **Snackbar**: Alerts the user if their passwords do not match.

#### 4. **Responsive Spacing**
   - The `_space` function generates consistent spacing using `SizeConfig.defaultSize`.

---

### Example Workflow

<p align="center"><img src="https://github.com/user-attachments/assets/039ac027-935d-49e0-96f2-c6b7c8c2f7b3"  alt="Output1" height="844" width="431.38"/></p>
<p align="center"><img src="https://github.com/user-attachments/assets/c0173c19-ee3f-4d64-93bc-3228124e650a"  alt="Output1"/></p>

**Video**

https://github.com/user-attachments/assets/ebbb379f-418a-4dc9-8ded-e803ebb283d7

---

### Key Features

- **Customizable Input Fields**: Easily replace `SnaporaTextField` and `SnaporaButton` with different styles.
- **Dynamic User Feedback**: Dialogs and snackbars improve interactivity.
- **Responsive Layout**: Consistent design on various devices using `SizeConfig`.

This signup page is a robust and reusable component for any Flutter app, focusing on validation, feedback, and responsive design.