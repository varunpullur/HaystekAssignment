//  Copyright © 2024 varunpullur. All rights reserved.

import SwiftUI

struct AsyncImageView: View {

  let url: String
  let width: CGFloat?
  let height: CGFloat?

  @State private var image: Image?
  @State private var isLoading = true

  init(url: String, width: CGFloat? = nil, height: CGFloat? = nil) {

    self.url = url
    self.width = width
    self.height = height

  }

  var body: some View {

    Group {

      if let displayImage = image {

        displayImage
          .resizable()
          .aspectRatio(contentMode: .fit)

      } else {

        ZStack {

          if isLoading {

            ProgressView()

          } else {

            Image(systemName: "photo")
              .foregroundColor(.gray)
          }

        }

      }

    }
    .frame(width: width, height: height)
    .task(id: url) {

      await loadImage()

    }

  }

  private func loadImage() async {

    if let cachedImage = await ImageCache.shared.image(for: url) {

      self.image = cachedImage
      self.isLoading = false

      return

    }

    guard let imageUrl = URL(string: url) else {

      self.isLoading = false
      return

    }

    do {

      let (data, _) = try await URLSession.shared.data(from: imageUrl)

      if let uiImage = UIImage(data: data) {

        let swiftUIImage = Image(uiImage: uiImage)
        await ImageCache.shared.setImage(swiftUIImage, for: url)
        self.image = swiftUIImage

      }

    } catch {

      print("Failed to load image: \(error)")

    }

    self.isLoading = false

  }
  
}
