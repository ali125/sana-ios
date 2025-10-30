//
//  SupabaseService.swift
//  Sana
//
//  Created by Morty on 8/8/1404 AP.
//

import Foundation
import Supabase

final class SupabaseService: ObservableObject {
    static let shared = SupabaseService()
    
    let client: SupabaseClient
    
    init() {
        let supabaseUrl = ProcessInfo.processInfo.environment["SUPABASE_URL"]!
        let supabaseKey = ProcessInfo.processInfo.environment["SUPABASE_KEY"]!
        
        self.client = SupabaseClient(supabaseURL: URL(string: supabaseUrl)!, supabaseKey: supabaseKey)
    }
}
