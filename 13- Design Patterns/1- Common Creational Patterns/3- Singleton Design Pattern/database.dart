// Singleton Database Class
class Database {
  // Private static instance
  static Database? _instance;

  // Private constructor
  Database._create() {
    print("Database instance created!");
  }

  // Public method to get the singleton instance
  static Database getInstance() {
    // Create instance if not exists
    _instance ??= Database._create();
    return _instance!;
  }

  // Example function
  void connect() {
    print("Connected to the database!");
  }
}

// Requirement 2: Client Class
class Client {
  void main() {
    print("Trying to create first instance...");
    Database db1 = Database.getInstance();
    db1.connect();

    print("\nTrying to create second instance...");
    Database db2 = Database.getInstance();
    db2.connect();

    // Check if both instances are the same
    print("\nChecking if both instances are the same:");
    print(
      db1 == db2
          ? "Singleton works! Both instances are the same."
          : "Something went wrong!",
    );
  }
}
