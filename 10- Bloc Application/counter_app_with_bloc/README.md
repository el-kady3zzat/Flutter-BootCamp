# Counter App with Bloc Architecture

## Overview
This project is a simple **Counter App** built using **Flutter** and the **flutter_bloc** package. It demonstrates the use of the **Bloc architecture** for state management and highlights clean, scalable coding practices.

---

## Features
1. **Increment and Decrement Counter**: 
   - The app allows the user to increment and decrement a counter using buttons.
   - The counter value is updated dynamically and displayed in the UI.

2. **Dialog Notifications**:
   - A dialog is shown when the counter reaches a maximum value of `10` or a minimum value of `-10`.
   - Additionally, the app can notify the user if the counter becomes negative.

3. **State Management with Bloc**:
   - The app utilizes the **Cubit** class from the flutter_bloc package to manage states.
   - UI rebuilds automatically when the state changes.

---

## Key Components
### 1. **CounterCubit**
- Handles the core business logic for the app.
- Manages the following states:
  - `CounterInitial`: Initial state with a counter value of 0.
  - `CounterIncrementState`: Emitted when the counter is incremented.
  - `CounterDecrementState`: Emitted when the counter is decremented.
  - `CounterMaxState`: Emitted when the counter reaches its maximum or minimum value.

### 2. **CounterState**
- Abstract class that defines the states of the counter.
- Subclasses include:
  - `CounterInitial`
  - `CounterIncrementState`
  - `CounterDecrementState`
  - `CounterMaxState`

### 3. **CounterScreen**
- The main screen of the app.
- Utilizes `BlocConsumer` to:
  - Rebuild the UI based on state changes.
  - Show dialogs as side effects when specific states are emitted.

---

## How It Works
1. **Increment/Decrement**:
   - When the user presses the "+" or "-" button, the `increment` or `decrement` method in `CounterCubit` is called.
   - The new state is emitted, and the UI updates accordingly.

2. **Dialog Notification**:
   - When the counter reaches `10` or `-10`, a dialog appears, notifying the user.
   - This is handled in the `BlocConsumer`'s `listener`.

3. **Negative Value Handling**:
   - The app detects when the counter becomes negative and can notify the user using dialogs.

---

## Output

**Video**

https://github.com/user-attachments/assets/6292d57f-25d6-42d3-bf99-4ced791f5aff