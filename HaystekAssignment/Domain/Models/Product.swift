//  Copyright © 2024 varunpullur. All rights reserved.

struct Product: Identifiable, Codable {
  
  let id: Int
  let title: String
  let price: Double
  let description: String
  let image: String
  let category: String
  let rating: Rating

}
