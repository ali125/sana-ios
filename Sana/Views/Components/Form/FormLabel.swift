//
//  FormLabel.swift
//  Sana
//
//  Created by Morty on 8/9/1404 AP.
//

import SwiftUI

struct FormLabel: View {
    var label: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
            
            Spacer()
        }
    }
}

#Preview {
    FormLabel(label: "Label")
}
