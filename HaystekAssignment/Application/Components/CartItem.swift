//  Copyright © 2024 varunpullur. All rights reserved.

import SwiftUI

struct CartItem: View {

  let product: Product
  let onDelete: () -> Void

  var body: some View {

    HStack {

      AsyncImageView(
        url: product.image,
        width: Constants.UI.cartThumbnailSize,
        height: Constants.UI.cartThumbnailSize
      )

      VStack(alignment: .leading) {

        Text(product.title)
          .lineLimit(2)
          .foregroundColor(AppColors.text)

        Text(product.price.asCurrency)
          .foregroundColor(AppColors.secondaryText)

      }

      Spacer()

      Button(action: onDelete) {

        Image(systemName: "trash")
          .foregroundColor(AppColors.Button.destructive)

      }

    }
    
  }

}
