//
//  FormHelper.swift
//  Sana
//
//  Created by Morty on 8/9/1404 AP.
//

import SwiftUI

struct FormHelper: View {
    var message: String
    var isInvalid: Bool = false
    
    var body: some View {
        HStack {
            Text(message)
                .foregroundStyle(isInvalid ? .red : .gray)
                .font(.caption)
            
            Spacer()
        }
    }
}

#Preview {
    FormHelper(message: "Message")
}
