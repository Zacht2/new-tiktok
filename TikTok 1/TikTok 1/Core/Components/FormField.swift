//
//  Form.swift
//  TikTok 1
//
//  Created by Zachary Thurston on 12/2/24.
//

import SwiftUI

struct FormField: View {
    @Binding var value: String
    var icon:String
    var placeholder: String
    var isSecure = false
    
    var body: some View {
        Group{
            HStack{
                Image(systemName: icon).padding()
                Group{
                    if isSecure {
                        SecureField(placeholder, text: $value)
                    } else {
                        TextField(placeholder, text: $value)
                        
                    }
                } .font(Font.system(size: 20, design: .monospaced))
                    .foregroundStyle(Color(.black))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                
            }.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 4)).padding()
        }
    
    }
}

