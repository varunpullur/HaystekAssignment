//  Copyright © 2024 varunpullur. All rights reserved.

import SwiftUI

struct CustomButton: View {

  let title: String
  let iconName: String?
  let backgroundColor: Color
  let action: () -> Void

  var body: some View {

    Button(action: action) {

      HStack {

        if let iconName = iconName {

          Image(systemName: iconName)

        }

        Text(title)
          .font(.headline)

      }
      .foregroundColor(.white)
      .frame(maxWidth: .infinity)
      .padding()
      .background(backgroundColor)
      .cornerRadius(Constants.UI.cornerRadius)

    }
    .padding(.horizontal, Constants.UI.standardPadding)

  }
  
}
