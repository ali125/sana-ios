//
//  ContentView.swift
//  Sana
//
//  Created by Morty on 8/1/1404 AP.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @StateObject var formController = FormController()

    func onSubmit() {
        formController.handleSubmit { formData in
            print(formData)
        }
    }
    var body: some View {
        VStack {
            InputController(
                control: formController,
                name: "mobile",
                label: "Mobile",
                helperMessage: "Your mobile number",
                rules: [
                    .required("Please enter username"),
                    .minLength(3, message: "Minimum length is 3"),
                    .maxLength(10, message: "Maximum length is 10")
                ]
            )
            .keyboardType(.numberPad)
            
            Button {
                onSubmit()
            } label: {
                Text("Submit")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
