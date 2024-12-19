void main() {
  // Create a library
  Library library = Library();

  // Add books /////////////////////////////////////////////////////////////////
  Book book1 = Book('B-1', 'Intro to Dart');
  Book book2 = Book('B-2', 'Intro to OOP');
  Book book3 = Book('B-3', 'Intro to Flutter');

  print('\n');

  print(library.customOutput(' Adding Books ', 42, '*'));
  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);
  print(library.customOutput('=', 42, '='));
  //////////////////////////////////////////////////////////////////////////////
  //
  //
  //
  // Add users /////////////////////////////////////////////////////////////////
  User user1 = User('U-1', "Qadi");
  User user2 = User('U-2', "Alaa");

  print('\n');

  print(library.customOutput(' Adding Users ', 42, '*'));
  library.addUser(user1);
  library.addUser(user2);
  print(library.customOutput('=', 42, '='));

  print('\n');
  //////////////////////////////////////////////////////////////////////////////
  //
  //
  //
  // Borrow a book /////////////////////////////////////////////////////////////
  library.borrowBook('B-1', 'U-1');
  library.borrowBook('B-3', 'U-2');
  //////////////////////////////////////////////////////////////////////////////
  //
  //
  //
  // Try to borrow an already borrowed book ////////////////////////////////////
  library.borrowBook('B-1', 'U-1');
  //////////////////////////////////////////////////////////////////////////////
  //
  //
  //
  // Return a book /////////////////////////////////////////////////////////////
  library.returnBook('B-1');

  print('\n');
  //////////////////////////////////////////////////////////////////////////////
  //
  //
  //
  // Display library info //////////////////////////////////////////////////////
  library.displayUsersInfo();
  print('\n');
  library.displayBooksInfo();
}

class Book {
  String id;
  String title;
  bool borrowed;
  String borrower;

  Book(this.id, this.title, {this.borrowed = false, this.borrower = ''});

  void displayInfo() {
    print('''Book Details:
        Id: $id
        Title: $title
        Borrowed: ${borrowed ? 'Borrowed' : 'Available'}
    ''');
  }
}

class User {
  String id;
  String name;

  User(this.id, this.name);

  void displayInfo() {
    print('''User Details:
        Id: $id
        Name: $name
    ''');
  }
}

class Library {
  List<Book> books = [];
  List<User> users = [];

  void addBook(Book book) {
    books.add(book);
    print('Book \'${book.title}\' Successfully Added');
  }

  void addUser(User user) {
    users.add(user);
    print('User \'${user.name}\' Successfully Added');
  }

  Book? findBookById(String bookId) {
    try {
      return books.firstWhere((book) => book.id == bookId);
    } catch (e) {
      print('Book with ID $bookId not found');
      return null;
    }
  }

  User? findUserById(String userId) {
    try {
      return users.firstWhere((user) => user.id == userId);
    } catch (e) {
      print('User with ID $userId not found');
      return null;
    }
  }

  void borrowBook(String bookId, String userId) {
    Book? book = findBookById(bookId);
    User? user = findUserById(userId);

    if (book != null && user != null) {
      if (!book.borrowed) {
        book.borrowed = true;
        book.borrower = user.id;
      } else {
        print('Book \'${book.id}\' is already borrowed');
      }
    }
  }

  void returnBook(String bookId) {
    Book? book = findBookById(bookId);

    if (book != null) {
      if (book.borrowed) {
        book.borrowed = false;
        book.borrower = '';
        print('Book \'${book.title}\' Returned');
      } else {
        print('Book \'${book.title}\' was not borrowed');
      }
    }
  }

  void displayUsersInfo() {
    print('${customOutput(' Users ', 41, '*')}');
    print('=========================================');
    print('|| User Id ||           Name           ||');
    print('=========================================');

    for (var user in users) {
      print(
          '||${customOutput(user.id, 9, ' ')}||${customOutput(user.name, 26, ' ')}||');
      print('-----------------------------------------');
    }
  }

  void displayBooksInfo() {
    print('${customOutput(' Books Details ', 73, '*')}');
    print(
        '=========================================================================');
    print(
        '|| Book Id ||          Book Name          ||   Status   || Borrower Id ||');
    print(
        '=========================================================================');

    for (var book in books) {
      print(
          '||${customOutput(book.id, 9, ' ')}||${customOutput(book.title, 29, ' ')}||${customOutput(book.borrowed ? 'Borrowed' : 'Available', 12, ' ')}||${customOutput(book.borrower, 13, ' ')}||');
      print(
          '-------------------------------------------------------------------------');
    }
  }

  String customOutput(String txt, int spacesLength, String char) {
    int spacesCount = spacesLength - txt.length;
    int spaceGroup = (spacesCount ~/ 2).toInt();
    bool hasMod = (spacesCount % 2 != 0) ? true : false;

    return (char * spaceGroup) +
        txt +
        ((char * spaceGroup) + (hasMod ? char : ''));
  }
}
