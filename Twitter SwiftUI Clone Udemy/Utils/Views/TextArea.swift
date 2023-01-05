//
//  TextArea.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/04.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeHolder: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self._text = text
        self.placeHolder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeHolder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}
