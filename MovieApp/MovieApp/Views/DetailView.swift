//
//  DetailView.swift
//  MovieApp
//
//  Created by Ádám-Krisztián Német on 11.05.2021.
//

import SwiftUI

import SwiftUI

struct DetailView: View {
    var movie: Movie
    
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        NavigationView {
            VStack {
                if movie.title != nil {
                    Text(movie.title!)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                } else {
                    Text("Title is missing")
                }
                Spacer(minLength: 20)
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .scaledToFit()
                }
                if movie.year != nil {
                    Text(movie.year!)
                } else {
                    Text("Year is missing")
                }
                
                Spacer()
                if movie.rate != nil {
                    Text("Rating: \(movie.rate!, specifier: "%.2f")/10")
                } else {
                    Text("Rating is missing")
                }
                Spacer()
                if movie.overview != nil {
                    Text(movie.overview!)
                        .padding()
                } else {
                    Text("Overview is missing")
                }
            }
            .navigationBarTitle("")
                    .navigationBarHidden(true)
            
        }
            
            
            .onAppear {
                if self.movie.posterImage != nil {
                    self.imageLoader.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w300" + self.movie.posterImage!)!)
                }
            }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailView(movie: Movie(title: "MovieTitle", id: 1234, year: "2009", rate: 23, posterImage: "SDSDS", overview: "Long overview", key: 2323))
        }
    }
}

