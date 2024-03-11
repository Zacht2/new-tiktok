//
//  SearchBar.swift
//  TikTok 1
//
//  Created by Zachary Thurston on 26/2/24.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var value: String
    @State var isSearching = false

    var body: some View {
        
        HStack{
            TextField("Search Users Here", text:$value)
                .padding(.leading, 24)
        }.padding()
            .background(Color(.gray))
            .cornerRadius(6.0)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
                    .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    Button( action: {value = ""} ){
                        Image(systemName: "xmark.circle.fill")
                    }
                    
                }.padding(.horizontal, 32)
                    .foregroundStyle(Color(.gray))
            )
    }
}
