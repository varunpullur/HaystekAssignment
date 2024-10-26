//  Copyright © 2024 varunpullur. All rights reserved.

import Alamofire
import Combine
import Foundation

protocol ProductApiRepositoryProtocol {

  func getProducts() -> AnyPublisher<[Product], NetworkError>

}
