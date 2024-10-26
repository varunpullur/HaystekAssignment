//  Copyright © 2024 varunpullur. All rights reserved.

import Alamofire
import Foundation

struct GetAllProducts: URLRequestConvertible {

  func asURLRequest() throws -> URLRequest {

    let apiUrl = "https://fakestoreapi.com/products"

    guard let url = URL(string: apiUrl) else {

      throw NetworkError.networkError("invalid URL")

    }

    var request = URLRequest(url: url)

    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    return request

  }

}
