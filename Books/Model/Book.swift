
//
//  Book.swift
//  Books
//
//  Created by Bruno Mazzocchi on 1/3/25.
//

import Foundation
import SwiftUI

import SwiftUI

struct Book: Decodable, Identifiable {
    
    let id: Int64
    let title: String
    let author: String
    let color: LinearGradient
    let thumbnail: String
    let rating: Double

    private enum CodingKeys: String, CodingKey {
        case id, title, author, color, thumbnail, rating
    }

    init(id: Int64, title: String, author: String, color: LinearGradient, thumbnail: String, rating: Double) {
        self.id = id
        self.title = title
        self.author = author
        self.color = color
        self.thumbnail = thumbnail
        self.rating = rating
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int64.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.author = try container.decode(String.self, forKey: .author)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
        self.rating = try container.decode(Double.self, forKey: .rating)

        // Decode color string (comma-separated hex colors)
        let colorString = try container.decode(String.self, forKey: .color)
        self.color = Color.gradient(from: colorString)
    }
}


extension Book {
    static func fromDatabaseRow(_ row: [String: Any]) -> Book? {
        guard
            let id = row["id"] as? Int64,
            let title = row["title"] as? String,
            let author = row["author"] as? String,
            let colorString = row["color"] as? String,
            let thumbnail = row["thumbnail"] as? String,
            let rating = row["rating"] as? Double
        else {
            return nil
        }

        return Book(
            id: id,
            title: title,
            author: author,
            color: Color.gradient(from: colorString),
            thumbnail: thumbnail,
            rating: rating
        )
    }
}


let mockTextDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."


let sampleBook: [Book] = [
        Book(
            id: 2,
             title: "1984",
             author: "George Orwell",
             color: Color.gradient(from: "#FFFF00,#FFA500"),
             thumbnail: "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1327144697i/3744438.jpg",
             rating: 4.8
            )
        ]
