# Haystek Assignment

![Simulator Screenshot - iPhone 16 Pro - 2024-10-26 at 10 53 53](https://github.com/user-attachments/assets/c12cce23-f854-4555-a346-0199efd4e67d)
![Simulator Screenshot - iPhone 16 Pro - 2024-10-26 at 10 53 59](https://github.com/user-attachments/assets/67c8a53c-5c86-4302-8e51-1ae57a39d776)
![Simulator Screenshot - iPhone 16 Pro - 2024-10-26 at 10 54 04](https://github.com/user-attachments/assets/51c0d69a-fd7a-4428-a1db-0e99386f8765)

## Features

- 🏪 Product catalog with category filtering
- 🛒 Shopping cart functionality
- ⭐ Product ratings and reviews
- 📱 Responsive grid layout
- 🌅 Efficient image loading and caching
- 🎨 Clean and modern UI design
- 🔄 Category-based filtering
- 💳 Checkout process
- 🏷️ Price formatting
- 🔍 Detailed product views

## Architecture

The app follows the MVVM (Model-View-ViewModel) architecture pattern and incorporates modern iOS development practices:

- **Views**: SwiftUI views for UI components
- **ViewModel**: Manages business logic and data flow
- **Repository**: Handles data fetching and API communication
- **Models**: Represents the data structure
- **Networking**: Uses Alamofire for API requests
- **Image Loading**: Custom async image loading with caching

## Technical Stack

- 📱 SwiftUI
- 🔄 Combine Framework
- 🌐 Alamofire
- 💾 Actor-based Image Caching
- 🎨 Custom UI Components
- ⚡ Async/Await for image loading

## Requirements

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Key Components

### Views
- **ContentView**: Main tab view containing the product grid and cart
- **ProductGridView**: Displays products in a grid layout with category filtering
- **ProductDetailView**: Shows detailed product information
- **CartView**: Manages shopping cart functionality

### ViewModel
- **ProductViewModel**: Manages product data, cart operations, and category filtering

### Networking
- **ProductApiRepository**: Handles API communication using Alamofire
- **NetworkError**: Comprehensive error handling for network requests

### Utilities
- **ImageCache**: Actor-based image caching system
- **Constants**: App-wide configuration values
- **AppColors**: Centralized color management

## API Integration

The app uses the [Fake Store API](https://fakestoreapi.com/) for product data. The `ProductApiRepository` handles all API communication, including:

- Fetching product listings
- Error handling
- Response parsing

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

- [Fake Store API](https://fakestoreapi.com/) for providing the product data
- Alamofire for networking
- SwiftUI for the modern UI framework
