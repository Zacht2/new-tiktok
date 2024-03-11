//
//  PostModel.swift
//  TikTok 1
//
//  Created by Zachary Thurston on 16/2/24.
//

import Foundation

struct PostModel: Encodable, Decodable {
    
    var caption: String
    var likes: [String: Bool]
    var geoLocation: String
    var ownerId: String
    var postId: String
    var username: String
    var profile: String
    var mediaUrl: String
    var date: Double
    var likeCount: Int
    
    
    }
