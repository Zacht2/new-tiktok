//
//  CurrentUserProfileView.swift
//  TikTok 1
//
//  Created by Zachary Thurston on 11/2/24.
//

import SwiftUI
import FirebaseAuth
import SDWebImageSwiftUI

struct CurrentUserProfileView: View {
    @EnvironmentObject var session: SessionStore
    @State private var selection = 1
    @StateObject var profileService = ProfileService()
    
    let threeColumns = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView(user: self.session.session, postsCount: profileService.posts.count, following: $profileService.following, followers: $profileService.followers)
                Button{
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .foregroundStyle(.black)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
                Picker("", selection: $selection) {
                    Image(systemName: "circle.grid.2x2.fill").tag(0)
                    Image(systemName: "person.circle").tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
                
                if selection == 0 {
                    LazyVGrid(columns: threeColumns) {
                        ForEach(self.profileService.posts, id:\.postId) {
                            (post) in
                            
                            WebImage(url: URL(string: post.mediaUrl)!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/3).clipped()
                        }
                    }
                }
                else 
                if (self.session.session == nil) { Text("")}
                else{
            
                    ScrollView{
                        
                        VStack {
                            ForEach(self.profileService.posts, id:\.postId) {
                                (post) in
                                
                                PostCardImage(post: post)
                            PostCard(post: post)
                            }
                        }
                    }
                }
                
            }
        } .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {}){
                NavigationLink(destination: UserProfile()){
                    Image(systemName: "person.fill")
                }
            }, trailing: Button(action: {
                self.session.logout()
            }){
                Image(systemName: "arrow.right.circle.fill")
            })
            .onAppear{
                self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
            }
    }
}
    
    
    
    //    NavigationStack {
      //      ScrollView {
        //        VStack(spacing: 2) {
          //
                    // profile header
           //         ProfileHeaderView()
                    
                    // post grid view
             //       PostGridView()
                    
                
              //  .padding(.top)
            
            //.navigationTitle("Profile")
           // .navigationBarTitleDisplayMode(.inline)
    

#Preview {
    CurrentUserProfileView()
}
