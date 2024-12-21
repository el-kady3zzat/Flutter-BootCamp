## Code Explanation

### Overview
This project is a simplified shopping app interface built using Flutter. The app features a customizable and responsive UI to display product details, offers, and shopping functionalities.

---

### Code Components

#### 1. **Main Application**
   - Initializes the application with `SizeConfig` for responsive design.
   - Sets up a custom theme with a specific font and text styling.
   - The initial page is `ShoppingPage`, where the shopping interface is displayed.

#### 2. **SizeConfig Utility**
   - Provides a method to initialize screen properties such as width, height, orientation, and a `defaultSize` for scaling UI elements.
   - Ensures the UI is adaptable across different devices and screen sizes.

#### 3. **ProductCard Widget**
   - **Purpose**: Displays product information, including:
     - Product image, title, rating, price (with sale indication if applicable), and stock status.
     - "Add to Cart" button with a Snackbar confirmation on tap.
   - **Features**:
     - Sale badge for discounted products.
     - Dynamic UI components like stock status and price adjustments.
     - Interactive "Add to Cart" button.
   - **Responsive Design**: Utilizes `SizeConfig` for consistent sizing and spacing.

#### 4. **Product Model**
   - Defines a product's properties such as `id`, `title`, `price`, `stock`, `rate`, `imgs`, and sale-related details.
   - Provides a structure for handling product data dynamically.

#### Example Product Properties:
<p align="center"><img src="https://github.com/user-attachments/assets/85b85dd2-b642-4e07-89cb-72f128b73322"  alt="Output1" height="844" width="431.38"/></p>
<p align="center"><img src="https://github.com/user-attachments/assets/dc13747d-0c8a-43f0-b40c-d339b7036751"  alt="Output2"/></p>

**Video**

https://github.com/user-attachments/assets/354b063b-83d5-42be-a94b-80b5be7bfcee




#### Key Features:
   - **Responsive UI**: Adapts to various screen sizes using SizeConfig.
   - **Product Details**: Rich information display for each product.
   - **User Interaction**: Engaging elements like "Add to Cart" with Snackbar feedback.
   - **Custom Theming**: Centralized theme settings with custom fonts and colors.