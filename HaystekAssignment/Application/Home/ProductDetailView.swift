//  Copyright © 2024 varunpullur. All rights reserved.

import SwiftUI

struct ProductDetailView: View {
  
  let product: Product
  @ObservedObject var viewModel: ProductViewModel

  var isInCart: Bool {

    viewModel.cartItems.contains(product.id)

  }

  var body: some View {

    ScrollView {

      VStack(alignment: .leading, spacing: Constants.UI.standardPadding) {

        AsyncImageView(url: product.image, height: Constants.UI.productImageHeight)
          .frame(maxWidth: .infinity)

        VStack(alignment: .leading, spacing: Constants.UI.minimumSpacing) {

          Text(product.title)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(AppColors.text)

          Text(product.price.asCurrency)
            .font(.title3)
            .foregroundColor(AppColors.secondaryText)

          HStack {

            StarsView(rating: product.rating.rate)
            Text("(\(product.rating.count) reviews)")
              .font(.subheadline)
              .foregroundColor(AppColors.secondaryText)

          }

          Text(product.description)
            .padding(.top)
            .foregroundColor(AppColors.text)

          Spacer()

          CustomButton(
              title: isInCart ? "Remove from Cart" : "Add to Cart",
              iconName: isInCart ? "cart.badge.minus" : "cart.badge.plus",
              backgroundColor: isInCart ? AppColors.Button.destructive : AppColors.Button.primary
          ) {
              viewModel.toggleCart(for: product.id)
          }
          .padding(.top)

        }
        .padding(Constants.UI.standardPadding)

      }

    }
    .navigationBarTitleDisplayMode(.inline)

  }
  
}
