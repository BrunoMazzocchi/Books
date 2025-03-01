//
//  Supabase.swift
//  Books
//
//  Created by Bruno Mazzocchi on 1/3/25.
//

import Supabase
import Foundation

struct SupabaseConfig {
    static let url = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_URL") as? String ?? ""
    static let key = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_KEY") as? String ?? ""
}

let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://\(SupabaseConfig.url)")!,
    supabaseKey: SupabaseConfig.key
)
