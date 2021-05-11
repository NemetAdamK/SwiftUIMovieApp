//
//  ContentView.swift
//  MovieApp
//
//  Created by Ádám-Krisztián Német on 11.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText : String
    @ObservedObject var viewState: MovieViewModel
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0, content: {
                TextField("Search for a movie:", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 55)
                    .padding()
                    .onChange(of: searchText) { newValue in
                                if searchText == "" {
                                    viewState.fetchMovies(searchText: "")
                                } else {
                                    viewState.fetchMovies(searchText: searchText)
                                }
                            }

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 16){
                        ForEach(viewState.movies) {movie in
                            MoviePreview(movie: movie)
                            NavigationLink(
                                destination: DetailView(movie: movie),
                                label: {
                                    Text("See movie details")
                                })
                        }
                    }
                }
            .onAppear {
                if viewState.movies.count < 1 {
                    viewState.fetchMovies(searchText: "")
                    
                    }
                }
            })
            .navigationBarTitle("")
                    .navigationBarHidden(true)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    @State static var searchText = ""
    static var previews: some View {
        ContentView(searchText: searchText, viewState: MovieViewModel())
    }
}
extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
