//
//  Category.swift
//  JakpostNews
//
//  Created by Hidayat Abisena on 20/12/23.
//

import Foundation

// MARK: - Category
struct Category: Codable {
    let status: Int
    let category: [CategoryElement]
}

// MARK: - CategoryElement
struct CategoryElement: Codable {
    let name: String
    let link: String
    let subCategory: [SubCategory]?
}

// MARK: - SubCategory
struct SubCategory: Codable {
    let name: String
    let link: String
}
