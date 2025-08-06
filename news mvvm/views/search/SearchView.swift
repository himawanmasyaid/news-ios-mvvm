//
//  SearchView.swift
//  news mvvm
//
//  Created by Himawan on 13/12/24.
//

import Foundation
import SwiftUI

struct SearchView: View {
    
    @State private var keyword: String = ""

    @StateObject var viewModel = SearchViewModel()

    
    var body: some View {
        VStack {

            SearchBarView(keyword: $keyword, onSearch: onActionSearch)
            
            Spacer()
            
            
            // content headline news
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
        .onAppear {

        }
    }
    
    private func onActionSearch() {
        viewModel.searchNews(keyword: keyword)
    }
    
    
    
}


#Preview {
    SearchView()
}

