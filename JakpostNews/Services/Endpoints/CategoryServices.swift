//
//  CategoryServices.swift
//  JakpostNews
//
//  Created by Hidayat Abisena on 20/12/23.
//

import Foundation

class CategoryServices {
    static let shared = CategoryServices()
    
    private init() {}

    func fetchCategories() async throws -> Category {
        guard let url = URL(string: Constants.categoriesURL) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let categories = try JSONDecoder().decode(Category.self, from: data)
        return categories
    }
}
