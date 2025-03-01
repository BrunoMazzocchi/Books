//
//  ContentView.swift
//  Books
//
//  Created by Bruno Mazzocchi on 1/3/25.
//

import SwiftUI

struct ContentView: View {
    @State var books: [Book] = []
    var body: some View {
        SearchView(books: books)
            .overlay {
                if books.isEmpty {
                    ProgressView()
                }
            }
            .task {
                do {
                    books = try await supabase.from("books").select().execute().value
                } catch {
                    dump (error)
                }
            }
    }
}

#Preview {
    ContentView()
}
