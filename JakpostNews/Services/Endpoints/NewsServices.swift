//
//  NewsServices.swift
//  JakpostNews
//
//  Created by Hidayat Abisena on 20/12/23.
//

import Foundation

class NewsService {
    static let shared = NewsService()
    
    func fetchNews() async throws -> NewsResponse {
        guard let url = URL(string: Constants.categoryNameURL) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let news = try JSONDecoder().decode(NewsResponse.self, from: data)
        return news
    }
}

extension NewsService {
    func loadNews(forCategory category: String) async throws -> NewsResponse {
        let urlString = "https://jakpost.vercel.app/api/category/\(category)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let news = try JSONDecoder().decode(NewsResponse.self, from: data)
        return news
    }
}
