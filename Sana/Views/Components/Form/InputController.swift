//
//  SwiftUIView.swift
//  Sana
//
//  Created by Morty on 8/9/1404 AP.
//

import SwiftUI

enum Rules {
    case required(String)
    case minLength(Int, message: String?)
    case maxLength(Int, message: String?)
}


struct InputController: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    InputController()
}
