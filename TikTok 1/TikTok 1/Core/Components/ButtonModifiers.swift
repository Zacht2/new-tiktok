//
//  SwiftUIView.swift
//  TikTok 1
//
//  Created by Zachary Thurston on 12/2/24.
//

import SwiftUI

struct ButtonModifiers: ViewModifier {

    func body(content: Content) -> some View {
        content
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .frame(height: 20)
            .padding()
            .foregroundStyle(Color(.white))
            .font(.system(size: 14, weight: .bold))
            .background(Color.black)
            .cornerRadius(5.0)
    }
    }
