//  Copyright © 2024 varunpullur. All rights reserved.

import SwiftUI

struct CartView: View {

  @ObservedObject var viewModel: ProductViewModel
  @State private var showingThankYou = false

  var cartProducts: [Product] {

    viewModel.products.filter { viewModel.cartItems.contains($0.id) }

  }

  var totalAmount: Double {

    cartProducts.reduce(0) { $0 + $1.price }

  }

  var body: some View {

    NavigationView {

      ZStack {

        if cartProducts.isEmpty {

          VStack {

            Image(systemName: "cart")
              .font(.system(size: 60))
              .foregroundColor(AppColors.secondaryText)
              .padding()

            Text("Your cart is empty")
              .font(.headline)
              .foregroundColor(AppColors.secondaryText)

          }

        } else {

          VStack {

            List {

              ForEach(cartProducts) { product in

                CartItem(product: product) {

                  viewModel.toggleCart(for: product.id)
                  
                }

              }

            }

            VStack(spacing: Constants.UI.minimumSpacing) {

              HStack {

                Text("Total:")
                  .font(.headline)

                Spacer()

                Text(totalAmount.asCurrency)
                  .font(.headline)

              }
              .padding(.horizontal, Constants.UI.standardPadding)

              CustomButton(
                  title: "Checkout",
                  iconName: nil,
                  backgroundColor: AppColors.Button.primary
              ) {
                  showingThankYou = true
              }

            }
            .padding(.vertical, Constants.UI.standardPadding)
            .background(AppColors.background)

          }

        }

      }
      .navigationTitle("Cart")

    }
    .alert("Thank You!", isPresented: $showingThankYou) {

      Button("OK") {

        viewModel.cartItems.removeAll()

      }

    } message: {

      Text("Your order has been placed successfully.")

    }

  }
  
}
