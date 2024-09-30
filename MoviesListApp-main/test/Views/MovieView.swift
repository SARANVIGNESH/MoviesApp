//
//  MovieView.swift
//  test
//
//  Created by Saranvignesh Soundararajan on 31/07/23.
//

import Foundation
import SwiftUI


struct MovieView: View {
    
    @State private var selectedSegment = 0
    
    init(){
            UITableView.appearance().backgroundColor = UIColor(Color.clear)
        }
    
//    @State private var moviesList: [MovieModel] = []
    @StateObject var movieViewModel: MovieDataModel = MovieDataModel()
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                        selectedSegment = 0
                    }) {
                        Text("Popular")
                            .padding()
                            .foregroundColor(selectedSegment == 0 ? .white : .gray)
                            .background(Color.clear)
                    }
                    
                    Button(action: {
                        selectedSegment = 1
                    }) {
                        Text("Upcoming")
                            .padding()
                            .foregroundColor(selectedSegment == 1 ? .white : .gray)
                            .background(Color.clear)
                    }
                    
                    Button(action: {
                        selectedSegment = 2
                    }) {
                        Text("Top Rated")
                            .padding()
                            .foregroundColor(selectedSegment == 2 ? .white : .gray)
                            .background(Color.clear)
                    }
                }
                .navigationBarItems(leading: Text("The Movies DB").foregroundColor(.white).padding(), trailing: Image(systemName: "heart").foregroundColor(.white).padding())
                .navigationBarBackButtonHidden(true)
                Spacer()
                if selectedSegment == 0 {
                    List(movieViewModel.moviesList, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(movieImage: movie.movieImage, movieName: movie.movieName)) {
                            HStack {
                                AsyncImage(url: URL(string: movie.movieImage)!) { phase in
                                    switch phase {
                                    case .empty:
                                        // Placeholder view while loading
                                        Color.gray
                                            .frame(width: 180, height: 180)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 180, height: 180)
                                            .cornerRadius(20)
                                        
                                    case .failure(_):
                                        // Placeholder view for failed image
                                        Color.red
                                            .frame(width: 180, height: 180)
                                    }
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(movie.movieName)
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                        .padding([.top, .leading], 30)
                                    Text(movie.matchPercent)
                                        .foregroundColor(.gray)
                                        .padding(.top, 5)
                                        .padding(.leading ,30)
                                    Spacer()
                                    Text("2022")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .padding([.bottom, .leading], 30)
                                }
                            }
                        }
                        .listRowBackground(Color.black)
                    }
                    .listStyle(.plain)
                    .navigationBarColor(.black)
                }
            }
            
        }
        .onAppear {
            readJSONFile()
        }
        
    }
    
    private func readJSONFile() {
        if let path = Bundle.main.url(forResource: "MoviesList", withExtension: "json"){
            print(path)
            do {
                let data = try Data(contentsOf: path)
                print("the data is \(data)")
                let jsonDecoder = JSONDecoder()
                let dataFromJson =  try jsonDecoder.decode([MovieModel].self, from: data)
                movieViewModel.moviesList = dataFromJson
            } catch {
                print("no data")
            }
            
        } else {
            print("json error")
        }
    }
    
    
    
}

extension View {
    func navigationBarColor(_ color: UIColor) -> some View {
        self.modifier(NavigationBarColorModifier(color: color))
    }
}

struct NavigationBarColorModifier: ViewModifier {
    init(color: UIColor) {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = color
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
    }

    func body(content: Content) -> some View {
        content
    }
}









   

