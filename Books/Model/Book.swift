
//
//  Book.swift
//  Books
//
//  Created by Bruno Mazzocchi on 1/3/25.
//

import Foundation
import SwiftUI

struct Book: Identifiable {
    let id: UUID
    let title: String
    let author: String
    let color: LinearGradient
    let thumbnail: String
    let rating: Double
}

let mockTextDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."

let books: [Book] = [
    Book(
        id: UUID(),
        title: "To Kill a Mockingbird",
        author: "Harper Lee",
        color: LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom),
        thumbnail: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1553383690l/2657.jpg",
        rating: 4.8
    ),
    Book(
        id: UUID(),
        title: "1984",
        author: "George Orwell",
        color: LinearGradient(colors: [.gray, .black], startPoint: .top, endPoint: .bottom),
        thumbnail: "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1327144697i/3744438.jpg",
        rating: 4.8
    ),
    Book(
        id: UUID(),
        title: "The Great Gatsby",
        author: "F. Scott Fitzgerald",
        color: LinearGradient(colors: [.yellow, .orange], startPoint: .top, endPoint: .bottom),
        thumbnail: "https://upload.wikimedia.org/wikipedia/commons/7/7a/The_Great_Gatsby_Cover_1925_Retouched.jpg",
        rating: 4.8
    )
]
