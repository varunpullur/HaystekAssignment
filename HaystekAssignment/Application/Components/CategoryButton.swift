//  Copyright © 2024 varunpullur. All rights reserved.

import SwiftUI

struct CategoryButton: View {

  let category: ProductCategory
  let isSelected: Bool
  let action: () -> Void

  var body: some View {

    Button(action: action) {

      Text(category.displayName)
        .font(.subheadline)
        .padding(.horizontal, Constants.UI.standardPadding)
        .padding(.vertical, Constants.UI.minimumSpacing)
        .background(isSelected ? AppColors.Category.selected : AppColors.Category.unselected)
        .foregroundColor(isSelected ? .white : AppColors.text)
        .cornerRadius(20)

    }

  }
  
}
