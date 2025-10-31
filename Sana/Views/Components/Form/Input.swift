//
//  Input.swift
//  Sana
//
//  Created by Morty on 8/8/1404 AP.
//

import SwiftUI

struct Input: View {
    @Binding var text: String
    var label: String? = ""
    var placeholder: String? = ""
    var helperMessage: String? = ""
    var isInvalid: Bool? = false
    
    var body: some View {
        VStack() {
            if let label {
                FormLabel(label: label)
            }
            TextField("", text: $text, prompt: Text(placeholder ?? ""))
                .padding(.horizontal, 4)
                .onChange(of: text) { _, _ in
//                    validate()
                }
            
            Divider()
                .frame(height: 1)
                .background(isInvalid! ? .red : .gray)
            
            if helperMessage != nil {
                FormHelper(message: helperMessage!, isInvalid: isInvalid!)
            }
        }
    }
}


#Preview {
    Input(text: .constant(""))
}
