//  Copyright © 2024 varunpullur. All rights reserved.

import SwiftUI

struct ProductGridView: View {

  @ObservedObject var viewModel: ProductViewModel

  let columns = [
    
    GridItem(.flexible(), spacing: Constants.UI.gridSpacing),
    GridItem(.flexible(), spacing: Constants.UI.gridSpacing)

  ]

  var body: some View {

    NavigationView {

      VStack(spacing: 0) {

        ScrollView(.horizontal, showsIndicators: false) {

          HStack(spacing: Constants.UI.minimumSpacing) {

            ForEach(ProductCategory.allCases, id: \.self) { category in

              CategoryButton(
                category: category,
                isSelected: viewModel.selectedCategory == category
              ) {

                withAnimation(.easeInOut(duration: Constants.Animation.defaultDuration)) {

                  viewModel.selectedCategory = category

                }

              }

            }

          }
          .padding(Constants.UI.standardPadding)

        }

        Divider()

        ScrollView {

          if viewModel.isLoading {

            ProgressView()

          } else if let error = viewModel.error {

            Text(error)
              .foregroundColor(AppColors.destructive)

          } else {

            LazyVGrid(columns: columns, spacing: Constants.UI.gridSpacing) {

              ForEach(viewModel.filteredProducts) { product in

                ProductGridItem(
                  viewModel: viewModel,
                  product: product,
                  isInCart: viewModel.cartItems.contains(product.id)
                )
                .background(AppColors.background)
                .cornerRadius(Constants.UI.cornerRadius)

              }

            }
            .padding(Constants.UI.standardPadding)
            .animation(.easeOut(duration: Constants.Animation.defaultDuration), value: viewModel.selectedCategory)

          }

        }

      }
      .navigationTitle("Shop")

    }
    .onAppear {

      viewModel.fetchProducts()

    }

  }

}
