//
//  PostService.swift
//  TikTok 1
//
//  Created by Zachary Thurston on 16/2/24.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseStorage

class PostService{
    
    static var Posts = AuthService.storeRoot.collection("posts")
    
    static var AllPosts = AuthService.storeRoot.collection("allPosts")
    static var Timeline = AuthService.storeRoot.collection("timeline")
    
    
    static func PostsUserId(userId: String) -> DocumentReference {
        return Posts.document(userId)
    }
    
    static func timeinlineUserId(userId: String) -> DocumentReference {
        return Timeline.document(userId)
    }
    
    static func uploadPost(userId: String, caption: String, imageData: Data, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        guard let UserId = Auth.auth().currentUser?.uid else {
            return
        }
        let postId = PostService.PostsUserId(userId: userId).collection("posts").document().documentID
        
        let storagePostRef = StorageService.storagePostId(postId: postId)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        StorageService.savePostPhoto(userId: userId, caption: caption, postId: postId, imageData: imageData, metadata: metadata, storagePostRef: storagePostRef, onSuccess: onSuccess, onError: onError)
        }
    
    static func loadUserPosts(userId: String, onSuccess: @escaping(_ posts:[PostModel]) -> Void) {
        
        PostService.PostsUserId(userId: userId).collection("posts").getDocuments{
            (snapshot, error) in
            
            guard let snap = snapshot else {
                print("Error")
                return
            }
            var posts = [PostModel]()
            
            for doc in snap.documents {
                let dict = doc.data()
                guard let decoder = try? PostModel.init(fromDictionary: dict)
                        
                else {
                    return
                }
                posts.append(decoder)
            }
            onSuccess(posts)
        }
        
    }
    
    
    }

