//
//  NotificationView.swift
//  TikTok 1
//
//  Created by Zachary Thurston on 11/2/24.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 16){
                    ForEach( 0 ..< 10){ notification in
                        NotificationCell()
                        
                    }
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.vertical)
            
            }
        }
    }
#Preview {
    NotificationView()
}
