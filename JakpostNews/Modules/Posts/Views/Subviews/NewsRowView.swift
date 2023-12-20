//
//  NewsRowView.swift
//  JakpostNews
//
//  Created by Hidayat Abisena on 20/12/23.
//

import SwiftUI

struct NewsRowView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            AsyncImage(url: URL(string: post.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .foregroundStyle(.gray.opacity(0.3))
                    .aspectRatio(16/9, contentMode: .fill)
            }
            .frame(maxWidth: .infinity)
            .cornerRadius(10, corners: [.topLeft, .topRight])
            .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(post.title)
                    .font(.headline)
                    .lineLimit(2)
                    .padding(.top, 5)
                
                Text(post.headline)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .lineLimit(3)
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        .padding(.top, 5)
    }
}
