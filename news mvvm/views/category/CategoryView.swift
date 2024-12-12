//
//  CategoryView.swift
//  news mvvm
//
//  Created by Himawan on 12/12/24.
//

import Foundation
import SwiftUI


struct CategoryView: View {
    
    let category : CategoryModel
    
    @StateObject var viewModel = CategoryViewModel()

    
    var body: some View {
        
        VStack {
            
            if viewModel.isLoading {
                
                ProgressView("Loading...")
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
            } else if let error = viewModel.errorMessage {
                
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
            } else {
                
                ScrollView() {
                    // using for earch
                    ForEach(viewModel.newsList.indices, id: \.self) { index in
                        
                        let item = viewModel.newsList[index]
                        
                        NavigationLink(destination: NewsDetailView(news: item)) {
                            NewsItem(news:item)
                        }
                    }
                    
                }
                
            }
            
        }
        .navigationTitle("\(category.title)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getNewsByCategory(category: category.code)
        
        }
        
    }
    
    
    
}
