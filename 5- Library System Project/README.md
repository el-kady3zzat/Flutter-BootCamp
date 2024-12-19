# Library Management System

This program simulates a basic **Library Management System** where books and users can be managed, and borrowing/returning books functionality is implemented. The system provides a structure for tracking users, books, and their current statuses.

## Features
1. **Add Books**: Add books to the library with unique IDs and titles.
2. **Add Users**: Add users to the library with unique IDs and names.
3. **Borrow Books**: Allow users to borrow books if they are available.
4. **Return Books**: Allow users to return borrowed books.
5. **Display Information**:
   - Show details of all books, including their status (borrowed or available).
   - Show details of all users.

## Code Highlights
- **Book Class**: Represents a book with attributes like `id`, `title`, `borrowed` status, and `borrower` (ID of the user who borrowed the book).
- **User Class**: Represents a user with attributes like `id` and `name`.
- **Library Class**: Manages the list of books and users, with methods to add books/users, borrow/return books, and display information.
- **Custom Output Formatter**: A helper method to format the display of information in a tabular layout.

## Example Workflow
1. Create a library instance.
2. Add books and users to the library.
3. Perform operations like borrowing and returning books.
4. Display current statuses of books and users.

## Example Output
```plaintext
************** Adding Books **************
Book 'Intro to Dart' Successfully Added
Book 'Intro to OOP' Successfully Added
Book 'Intro to Flutter' Successfully Added
==========================================


************** Adding Users **************
User 'Qadi' Successfully Added
User 'Alaa' Successfully Added
==========================================


Book 'B-1' is already borrowed
Book 'Intro to Dart' Returned


***************** Users *****************
=========================================
|| User Id ||           Name           ||
=========================================
||   U-1   ||           Qadi           ||
-----------------------------------------
||   U-2   ||           Alaa           ||
-----------------------------------------


***************************** Books Details *****************************
=========================================================================
|| Book Id ||          Book Name          ||   Status   || Borrower Id ||
=========================================================================
||   B-1   ||        Intro to Dart        || Available  ||             ||
-------------------------------------------------------------------------
||   B-2   ||        Intro to OOP         || Available  ||             ||
-------------------------------------------------------------------------
||   B-3   ||      Intro to Flutter       ||  Borrowed  ||     U-2     ||
-------------------------------------------------------------------------
