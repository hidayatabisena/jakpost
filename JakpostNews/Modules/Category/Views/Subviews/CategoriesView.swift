//
//  CategoriesView.swift
//  JakpostNews
//
//  Created by Hidayat Abisena on 20/12/23.
//

import SwiftUI

struct CategoriesView: View {
    @ObservedObject var viewModel: CategoryViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.categories, id: \.link) { category in
                    Text(category.name)
                        .frame(width: 80)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(viewModel.selectedCategory == category.name.lowercased() ? Color.blue : Color.indigo)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                        .onTapGesture {
                            viewModel.selectedCategory = category.name.lowercased()
                        }
                }
            }
            .padding(.horizontal)
        }
        .task {
            viewModel.loadCategories()
        }
    }
}

#Preview {
    CategoriesView(viewModel: MockCategoryViewModel())
}
