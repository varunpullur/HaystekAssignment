//  Copyright © 2024 varunpullur. All rights reserved.

import Alamofire
import Combine
import Foundation

class ProductApiRepository: ProductApiRepositoryProtocol {

  func getProducts() -> AnyPublisher<[Product], NetworkError> {

    return AF.request(GetAllProducts())
      .validate()
      .publishDecodable(type: [Product].self)
      .value()
      .mapError { error in

        if let statusCode = error.responseCode,
           let networkError = NetworkError.fromStatusCode(statusCode) {

          return networkError

        }

        return NetworkError.networkError(error.localizedDescription)

      }
      .eraseToAnyPublisher()

  }

}
