//
//  SearchBarView.swift
//  news mvvm
//
//  Created by Himawan on 13/12/24.
//

import Foundation
import SwiftUI

struct SearchBarView: View {
    
    @Binding var keyword: String // Binding for search text
    var onSearch: () -> Void // Closure for search action
    
    var body: some View {
        HStack {
            // TextField for input
            TextField("Search...", text: $keyword)
                .padding(.leading, 16) // Add padding inside the TextField
                .frame(height: 50) // Set a consistent height
            
            // Search button with Image
            Button(action: {
                onSearch()
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray) // Set icon color
                    .padding(.horizontal, 16)
            }
        }
        .background(Color("SearchColor")) // Set background color using a custom extension
        .cornerRadius(12) // Make it rounded
        .padding(.horizontal, 16) // Add spacing from the edges
    }
}


#Preview {
    SearchBarView(keyword: .constant("")) {
        //
    }
}
