//
//  NewsViewModel.swift
//  JakpostNews
//
//  Created by Hidayat Abisena on 20/12/23.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var featuredPost: Post?
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let newsService = NewsService()
    
    func loadNews() async {
        DispatchQueue.main.async {
            self.isLoading = true
            self.errorMessage = nil
        }
        
        do {
            let response = try await newsService.fetchNews()
            DispatchQueue.main.async {
                self.featuredPost = response.featuredPost
                self.posts = response.posts
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
                print("Error loading news: \(error.localizedDescription)")
            }
        }
    }
}

