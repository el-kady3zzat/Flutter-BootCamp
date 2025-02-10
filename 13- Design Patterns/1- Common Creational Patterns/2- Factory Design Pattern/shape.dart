// Abstract Class & Concrete Shapes
abstract class Shape {
  void revealMe();
}

// Concrete implementations of Shape
class Circle implements Shape {
  @override
  void revealMe() {
    print("You chose to print Circle");
  }
}

class Rectangle implements Shape {
  @override
  void revealMe() {
    print("You chose to print Rectangle");
  }
}

class Square implements Shape {
  @override
  void revealMe() {
    print("You chose to print Square");
  }
}

// Shape Factory
class ShapeFactory {
  Shape? getShape(String shape) {
    switch (shape) {
      case 'circle':
        return Circle();
      case 'rectangle':
        return Rectangle();
      case 'square':
        return Square();
      default:
        return null;
    }
  }
}

// Test the factory
void main() {
  // Using the ShapeFactory to create objects
  Shape? shape1 = ShapeFactory().getShape("circle");
  Shape? shape2 = ShapeFactory().getShape("rectangle");
  Shape? shape3 = ShapeFactory().getShape("square");
  // Invalid case
  Shape? shape4 = ShapeFactory().getShape("triangle");

  // Printing messages
  shape1?.revealMe();
  shape2?.revealMe();
  shape3?.revealMe();
  shape4?.revealMe();
}
