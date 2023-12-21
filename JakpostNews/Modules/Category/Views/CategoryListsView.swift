//
//  CategoryListsView.swift
//  JakpostNews
//
//  Created by Hidayat Abisena on 20/12/23.
//

import SwiftUI

struct CategoryListsView: View {
    @StateObject private var viewModel = CategoryViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                CategoriesView(viewModel: viewModel)
                
                if viewModel.isContentUnavailable {
                    ContentUnavailableView()
                        .modifier(VCenterModifier())
                } else {
                    List(viewModel.news, id: \.link) { post in
                        NewsRowView(post: post)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(Constants.ViewTitles.news)
            .task {
                viewModel.loadNews(forSelectedCategory: "indonesia")
            }
        }
    }
}

#Preview {
    CategoryListsView()
}
