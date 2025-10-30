//
//  Input.swift
//  Sana
//
//  Created by Morty on 8/8/1404 AP.
//

import SwiftUI

struct Input: View {
    @Binding var text: String
    
    var body: some View {
        TextField("Input field", text: $text)
    }
}

#Preview {
    Input(text: .constant(""))
}
