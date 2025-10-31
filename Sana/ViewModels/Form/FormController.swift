//
//  FormViewModel.swift
//  Sana
//
//  Created by Morty on 8/9/1404 AP.
//

import Foundation

enum FieldAction {
    case invalid(([String]) -> Void)
    case isSubmitted(Bool)
}

class FormController: ObservableObject {
    @Published var control: [FieldAction] = []
    
    func handleSubmit() {
        
    }
}
