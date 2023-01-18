//
//  NewTweetView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/04.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject var tweetViewModel = UploadTweetViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    KFImage(URL(string: viewModel.user?.profileImageUrl ?? ""))
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    
                    

                    TextField("", text: $captionText, prompt: Text("What's happening?"), axis: .vertical)
                        .padding(.top, 24)
                }
                .padding()
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.blue)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        tweetViewModel.uplaodTweet(caption: captionText)
                    } label: {
                        Text("Tweet")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isPresented: .constant(true))
            .environmentObject(AuthViewModel.shared)
    }
}
