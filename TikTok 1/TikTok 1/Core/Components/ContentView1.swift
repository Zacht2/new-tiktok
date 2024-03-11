//
//  ContentView.swift
//  TikTok 1
//
//  Created by Zachary Thurston on 12/2/24.
//

import SwiftUI

struct ContentView1: View {
    @State private var mail = ""
    @State private var password = ""

    
    var body: some View {
        VStack{
            FormField(value: $mail, icon: "mail", placeholder: "E-Mail")
            FormField(value: $password, icon: "lock", placeholder: password, isSecure: true)
        }
    }
}

#Preview {
    ContentView1()
}
