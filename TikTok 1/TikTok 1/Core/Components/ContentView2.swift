//
//  ContentView2.swift
//  TikTok 1
//
//  Created by Zachary Thurston on 13/2/24.
//

import SwiftUI

struct ContentView2: View {
    @EnvironmentObject var session: SessionStore
    
    func listen(){
        session.listen()
    }
    
    var body: some View {
        
        Group{
            if(session.session != nil) {
                HomeView()
            } else {
                SignInView()
            }
        }.onAppear(perform: listen)
       
    }
}

#Preview {
    ContentView2()
}
