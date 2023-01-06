//
//  CustomSecureField.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/06.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeHolder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeHolder)
                    .foregroundColor(.init(white: 1, opacity: 0.87))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16) {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
            }
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(text: .constant("text"), placeHolder: "입력하세요")
    }
}
