//
//  ContentUnavailableView.swift
//  JakpostNews
//
//  Created by Hidayat Abisena on 21/12/23.
//

import SwiftUI

struct ContentUnavailableView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundStyle(.gray)
            
            Text("Content Unavailable")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    ContentUnavailableView()
}
