//
//  NewsListView.swift
//  JakpostNews
//
//  Created by Hidayat Abisena on 20/12/23.
//

import SwiftUI

struct NewsListView: View {
    @ObservedObject var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                if let featuredPost = viewModel.featuredPost {
                    NewsRowView(post: featuredPost)
                }
                ForEach(viewModel.posts, id: \.link) { post in
                    NewsRowView(post: post)
                }
            }
            .listStyle(.plain)
            .navigationTitle(Constants.ViewTitles.news)
            .task {
                await viewModel.loadNews()
            }
        }
    }
}

#Preview {
    NewsListView()
}

