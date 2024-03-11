//
//  ProfileHeaderView.swift
//  TikTok 1
//
//  Created by Zachary Thurston on 11/2/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileHeaderView: View {
    var user: User?
    var postsCount: Int
    @Binding var following: Int
    @Binding var followers: Int
    
    var body: some View {
        VStack(spacing: 16){
            VStack(spacing: 8){
                if user != nil {
                 //   WebImage(url:URL(string: user!.profileImageUrl)!)
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 80, height: 80)
                    //    .foregroundStyle(Color(.systemGray5))
                        .padding(.leading)
                } else {
                    Color.init(red: 0.9, green: 0.9, blue: 0.9).frame(width: 80, height: 80)
                        .padding(.leading)
                        .clipShape(Circle())
                }
             //   Text(user!.username).font(.subheadline)
               //     .fontWeight(.semibold)
                  Text("Lewis Hamilton").font(.subheadline)
                       .fontWeight(.semibold)
            }
                

        }
            // stats view

            HStack(spacing: 16) {
                VStack{
                    Text("Posts").font(.caption)
                        Text("\(postsCount)").font(.subheadline).fontWeight(.bold)
                }.padding(.top)
                
                VStack{
                    Text("Followers").font(.caption)
                        Text("\(followers)").font(.subheadline).fontWeight(.bold)
                }.padding(.top)
                
                VStack{
                    Text("Following").font(.caption)
                        Text("\(following)").font(.subheadline).fontWeight(.bold)
                }.padding(.top)
                
            }
        
            
            Divider()
        }
    }
