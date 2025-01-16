# Employee List App

This Flutter project demonstrates a simple application that fetches employee data from a remote API and displays it in a list view. The app utilizes HTTP requests and JSON parsing to retrieve and handle data.

## Features
- **Fetch Employee Data**: Retrieves a list of employees from a mock API (`https://jsonplaceholder.typicode.com/users`).
- **Loading Indicator**: Displays a loading spinner while the data is being fetched.
- **List View**: Presents the fetched data in a scrollable list.

---

## Project Structure

### 1. **Home Screen (`Home` Widget)**
This is the main screen of the app that displays the list of employees.

#### Key Components:
- **`initState`**:
  - Calls the `getEmployees` method to fetch employee data on initialization.
  - Updates the `isLoading` flag to track the data loading state.
- **AppBar**:
  - Displays the title "Employees".
  - Styled with a `lightBlueAccent` background color.
- **Body**:
  - Shows a `CircularProgressIndicator` while data is loading.
  - Displays a `ListView` of employee data once loaded.

#### Methods:
- `getEmployees`:
  - Fetches the employee data using the `EmployeeApi` class.
  - Updates the state to remove the loading spinner and display the fetched data.

---

### 2. **Employee API (`EmployeeApi` Class)**
Handles the API call to fetch employee data.

#### Key Components:
- **Base URL**:
  - `https://jsonplaceholder.typicode.com/users`.
- **`getEmployees` Method**:
  - Sends a HTTP GET request to the API endpoint.
  - Decodes the JSON response into a list of `EmployeeModel` instances.
  - Handles error cases by throwing exceptions with detailed messages.

---

### 3. **Employee Model (`EmployeeModel` Class)**
Represents the structure of employee data.

#### JSON Mapping:
- Maps the JSON fields (e.g., `id`, `name`, `email`) into Dart object properties using a factory method `fromJson`.

---

## Dependencies
- **Flutter**: Framework for building the app.
- **Dio**: For making HTTP requests.
- **json**: For parsing JSON responses.

---

## Sample Output

### While Loading:
A centered loading spinner is displayed.

### Loaded Data:
A scrollable list of employees is shown, with:
- **Leading**: Employee ID.
- **Title**: Employee name.
- **Subtitle**: Employee email.
- **Trailing**: A person icon (`Icons.person_rounded`).

---


## Video

https://github.com/user-attachments/assets/586d36cf-9e22-4db4-88cf-f8dcfb7ab514