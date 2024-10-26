//  Copyright © 2024 varunpullur. All rights reserved.

import SwiftUI

struct ProductGridItem: View {
  
  @ObservedObject var viewModel: ProductViewModel
  
  let product: Product
  let isInCart: Bool
  
  var body: some View {
    
    NavigationLink(destination: ProductDetailView(product: product, viewModel: viewModel)) {
      
      VStack(alignment: .leading, spacing: Constants.UI.minimumSpacing) {

        AsyncImageView(url: product.image, width: Constants.UI.thumbnailSize)

        Text(product.title)
          .lineLimit(2)
          .font(.headline)
          .foregroundColor(AppColors.text)

        Text(product.price.asCurrency)
          .font(.subheadline)
          .foregroundColor(AppColors.secondaryText)

        HStack {
          
          StarsView(rating: product.rating.rate)
          Text("(\(product.rating.count))")
            .font(.caption)
            .foregroundColor(AppColors.secondaryText)

        }
        
        if isInCart {
          
          Text("In Cart")
            .font(.caption)
            .foregroundColor(AppColors.primary)
            .padding(.top, 4)
          
        }
        
      }
      .padding(Constants.UI.standardPadding)
      
    }
    
  }
  
}
