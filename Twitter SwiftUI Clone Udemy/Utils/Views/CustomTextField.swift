//
//  CustomTextField.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/06.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeHolder: String
    let imageName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeHolder)
                    .foregroundColor(.init(white: 1, opacity: 0.87))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
        }
    }
}
