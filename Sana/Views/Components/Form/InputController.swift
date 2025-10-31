//
//  SwiftUIView.swift
//  Sana
//
//  Created by Morty on 8/9/1404 AP.
//

import SwiftUI


struct InputController: View {
    @ObservedObject var control: FormController
    var name: String = ""
    var label: String? = ""
    var placeholder: String? = ""
    var defaultValue: String? = ""
    var helperMessage: String? = ""
    var rules: [FormRule] = []

    private var isInvalid: Bool {
        control.getFieldError(name) != nil && control.isSubmitted
    }
    
    private var errorMessage: String? {
        control.isSubmitted ? control.getFieldError(name) : nil
    }

    var body: some View {
        Input(
            text: Binding(
                get: { control.getFieldValue(name) },
                set: { newValue in
                    control.setFieldValue(name, newValue)
                    control.validate(name, newValue, rules: rules)
                }
            ),
            label: label,
            placeholder: placeholder,
            helperMessage: isInvalid ? errorMessage : helperMessage,
            isInvalid: isInvalid
        )
        .onAppear {
            control.setFieldValue(name, defaultValue ?? "")
            control.validate(name, defaultValue ?? "", rules: rules)
        }
    }
}

#Preview {
    InputController(
        control: FormController(),
        name: "mobile"
    )
}
