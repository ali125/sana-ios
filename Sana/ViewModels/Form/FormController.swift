//
//  FormController.swift
//  Sana
//
//  Created by Morty on 8/9/1404 AP.
//

import Foundation

enum FormRule {
    case required(String)
    case minLength(Int, message: String?)
    case maxLength(Int, message: String?)
}

struct FieldState {
    var value: String
    var rules: [FormRule]?
    var error: String?
    
    var isValid: Bool {
        error == nil || error == ""
    }
}

class FormController: ObservableObject {
    @Published var fields: [String: FieldState] = [:]
    @Published var isSubmitted = false
    
    func setFieldValue(_ name: String, _ value: String) {
        if fields[name] == nil {
            fields[name] = FieldState(value: value, error: nil)
        } else {
            fields[name]?.value = value
        }
    }
    
    func setFieldError(_ name: String, _ error: String?) {
        if fields[name] == nil {
            fields[name] = FieldState(value: "", error: error)
        } else {
            fields[name]?.error = error
        }
    }
    
    func getFieldValue(_ name: String) -> String {
        fields[name]?.value ?? ""
    }
    
    func getFieldError(_ name: String) -> String? {
        fields[name]?.error
    }
    
    func validate(_ name: String, _ text: String, rules: [FormRule]) {
        setFieldError(name, nil)
        
        for rule in rules {
            switch(rule) {
            case .required(let message):
                if  text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    setFieldError(name, message)
                    return 
                }
            case .minLength(let value, let message):
                if text.count < value {
                    setFieldError(name, message ?? "Minimum length is \(value)")
                    return
                }

            case .maxLength(let value, let message):
                if text.count > value {
                    setFieldError(name, message ?? "Maximum length is \(value)")
                    return
                }
            }
        }
    }

    
    func handleSubmit(action: (_ formData: [String:String]) -> Void) {
        isSubmitted = true
        
        var isValid = fields.allSatisfy { field in
            field.value.isValid
        }
        
        if isValid {
            let fieldValues: [String: String] = fields.mapValues { $0.value }
            action(fieldValues)
        }
    }
}
