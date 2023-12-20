//
//  MockDataProvider.swift
//  JakpostNews
//
//  Created by Hidayat Abisena on 20/12/23.
//

import SwiftUI

class MockCategoryViewModel: CategoryViewModel {
    override init() {
        super.init()
        self.categories = [
            CategoryElement(name: "National", link: "https://jakpost.vercel.app/api/category/national", subCategory: nil),
            CategoryElement(name: "Business", link: "https://jakpost.vercel.app/api/category/business", subCategory: nil),
            CategoryElement(name: "City", link: "https://jakpost.vercel.app/api/category/city", subCategory: nil),
            CategoryElement(name: "World", link: "https://jakpost.vercel.app/api/category/world", subCategory: nil)
        ]
    }
}
