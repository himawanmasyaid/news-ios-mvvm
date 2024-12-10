//
//  ImageExt.swift
//  news mvvm
//
//  Created by Himawan on 9/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

func loadImage(
    urlString: String?,
    placeholder: some View = Image(systemName: "photo")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(.gray),
    aspectRatio: ContentMode = .fill,
    maxWidth: CGFloat? = nil,
    maxHeight: CGFloat? = 200
) -> some View {
    if let urlString = urlString, let url = URL(string: urlString) {
        return AnyView(
            WebImage(url: url)
                .resizable()
                .indicator(.activity) // Activity indicator while loading
                .transition(.fade(duration: 0.5)) // Fade animation
                .aspectRatio(contentMode: aspectRatio)
                .frame(maxWidth: .infinity, maxHeight: maxHeight)
                .clipped()
        )
    } else {
        return AnyView(
            placeholder
                .frame(width: .infinity, height: maxWidth)
        )
    }
}
