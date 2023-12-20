//
//  CategoryViewModel.swift
//  JakpostNews
//
//  Created by Hidayat Abisena on 20/12/23.
//

import SwiftUI

class CategoryViewModel: ObservableObject {
    @Published var categories: [CategoryElement] = []
    @Published var news: [Post] = []
    @Published var selectedCategory: String? {
        didSet {
            if let category = selectedCategory, !category.isEmpty {
                loadNews(forSelectedCategory: category)
            }
        }
    }
    @Published var errorMessage: String?
    
    func loadCategories() {
        Task {
            do {
                let categoryResponse = try await CategoryServices.shared.fetchCategories()
                DispatchQueue.main.async {
                    self.categories = categoryResponse.category.filter { !$0.name.isEmpty }
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func loadNews(forSelectedCategory category: String?) {
        guard let category = category?.lowercased(), !category.isEmpty else { return }
        print("Loading news for category: \(category)")
        
        Task {
            do {
                let newsResponse = try await NewsService().loadNews(forCategory: category)
                DispatchQueue.main.async {
                    self.news = newsResponse.posts
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    print("Error loading news: \(error)")
                }
            }
        }
    }
}
