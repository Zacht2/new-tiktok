//
//  FeedCell.swift
//  TikTok 1
//
//  Created by Zachary Thurston on 9/2/24.
//

import SwiftUI
import FirebaseAuth

struct FeedView: View {
    @EnvironmentObject var session: SessionStore
    @State var profileService = ProfileService()
    
    
    
    var body: some View {
        ScrollView{
            
            VStack{
                ForEach(self.profileService.posts, id:\.postId ) {
                    (post) in
                    
                    PostCardImage(post:post)
                    PostCard(post: post)
                }
            }
        }.navigationTitle("")
            .navigationBarHidden(true)
            .onAppear{
                self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
            }
    }
}

