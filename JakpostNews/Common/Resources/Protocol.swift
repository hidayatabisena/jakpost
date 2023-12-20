//
//  Protocol.swift
//  JakpostNews
//
//  Created by Hidayat Abisena on 20/12/23.
//

import Foundation

protocol NewsItem: Identifiable {
    var id: String { get }
    var title: String { get }
    var image: String { get }
    var headline: String { get }
    var category: String { get }
    var publishedAt: String { get }
}

