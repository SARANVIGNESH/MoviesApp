//
//  MovieDetailView.swift
//  test
//
//  Created by Saranvignesh Soundararajan on 31/07/23.
//

import Foundation
import SwiftUI

struct MovieDetailView: View {
    let movieImage: String
    let movieName: String
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: movieImage)!) { phase in
                        switch phase {
                        case .empty:
                            Color.gray
                                .frame(width: 200, height: 200)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 300)
                                .cornerRadius(20)

                        case .failure(_):
                            Color.red
                                .frame(width: 200, height: 200)
                        }
                    }
                    .padding()
                    HStack {
                        VStack(alignment: .leading) {
                            Text(movieName)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            Text("07/07/2022")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image("Image")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    .padding()
                    HStack {
                        Text("Action, Fantasy, Adventure")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("1h 23m")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    HStack {
                        Text("A villan will rise.")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding()
                    VStack(alignment: .leading) {
                        Text("Overview")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    HStack{
                        VStack(alignment: .leading){
                            Text("Status")
                                .foregroundColor(.gray)
                            Text("Released")
                                .foregroundColor(.white)
                        }
                        .padding()
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("Original Language")
                                .foregroundColor(.gray)
                            Text("English")
                                .foregroundColor(.white)
                            
                        }
                        .padding()
                    }
                    HStack{
                        VStack(alignment: .leading){
                            Text("Budget")
                                .foregroundColor(.gray)
                            Text("$ 80,000,000")
                                .foregroundColor(.white)
                        }
                        .padding()
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("Revenue")
                                .foregroundColor(.gray)
                            Text("$ 280,000,000")
                                .foregroundColor(.white)
                            
                        }
                        .padding()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: MyBackButtonImage())
        }
    }
    
}


struct MyBackButtonImage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.backward")
                .tint(.white)
        }
    }
}
