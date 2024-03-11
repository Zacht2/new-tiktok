//
//  UserModel.swift
//  TikTok 1
//
//  Created by Zachary Thurston on 12/2/24.
//

import Foundation

struct User: Encodable, Decodable {
    var uid: String
    var email: String
    var profileImageUrl: String
    var username: String
    var searchName: [String]
    var bio: String
    
}
