//
//  ProfileHeaderView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/04.
//

import SwiftUI

import Kingfisher

struct ProfileHeaderView: View {
    @State var selectedFilter: TweetFilterOptions = .tweets
    let user: User
    
    var body: some View {
        VStack {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 10, x: .zero, y: .zero)
            
            Text(user.fullname)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Billionaire by day, dark knight by night")
                .font(.system(size: 14))
                .padding(.top, 8)
            
            HStack(spacing: 40) {
                VStack {
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            ProfileActionButtonView(isCurrentUser: user.isCurrentUser)
            
            FilterButtonView(selectedOption: $selectedFilter)
                .padding()
            
            Spacer()
        }
    }
}
