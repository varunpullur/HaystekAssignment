//  Copyright © 2024 varunpullur. All rights reserved.

import SwiftUI

struct StarsView: View {

  let rating: Double
  let maxRating = 5

  var body: some View {

    HStack(spacing: 2) {

      ForEach(0..<maxRating, id: \.self) { index in

        Image(
          systemName: index < Int(rating) ? "star.fill" :
                (index < Int(ceil(rating)) ? "star.leadinghalf.filled" : "star")
        )
        .foregroundColor(.yellow)
        .font(.caption)

      }

    }

  }
  
}
