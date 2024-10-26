
enum ProductCategory: String, CaseIterable {

  case all = "All"
  case electronics = "electronics"
  case jewelery = "jewelery"
  case menSClothing = "men's clothing"
  case womenSClothing = "women's clothing"

  var displayName: String {

    switch self {

    case .all: return "All"
    case .electronics: return "Electronics"
    case .jewelery: return "Jewelry"
    case .menSClothing: return "Men's"
    case .womenSClothing: return "Women's"

    }

  }
  
}
