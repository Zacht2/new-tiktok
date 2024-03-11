//
//  ProfileService.swift
//  TikTok 1
//
//  Created by Zachary Thurston on 19/2/24.
//

import Foundation
import Firebase

class ProfileService: ObservableObject {
    
    @Published var posts: [PostModel] = []
    @Published var following = 0
    @Published var followers = 0
    
    static var following = AuthService.storeRoot.collection("following")
    static var followers = AuthService.storeRoot.collection("followers")
    
    static func followingCollection(userid: String) -> CollectionReference{
        
        return following.document(userid).collection("following")
    }
    
    static func followersCollection(userid: String) -> CollectionReference{
        
        return followers.document(userid).collection("followers")
    }
    
    func loadUserPosts(userId: String) {
        PostService.loadUserPosts(userId: userId) {
            (posts ) in
            
            self.posts = posts
        }
        follows(userId: userId)
        followers(userId: userId)
    }
    
    func follows(userId: String) {
        
        ProfileService.followingCollection(userid: userId).getDocuments {
            (querysnapshot, err) in
            
            if let doc = querysnapshot?.documents {
                self.following = doc.count
            }
        }
    }
    
    func followers(userId: String) {
        
        ProfileService.followersCollection(userid: userId).getDocuments {
            (querysnapshot, err) in
            
            if let doc = querysnapshot?.documents {
                self.followers = doc.count
            }
        }
    }
    
}
