//
//  MoviePreview.swift
//  MovieApp
//
//  Created by Ádám-Krisztián Német on 11.05.2021.
//

import SwiftUI

struct MoviePreview: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {

        HStack(alignment: .center, spacing: 10, content: {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                .resizable()
                .scaledToFit()
                    .frame(width: 100, height: 200, alignment: .leading)
                    .padding()
            }
            Text(movie.title!)
                .lineLimit(2)
                .frame(width: 200, height: 200, alignment: .leading)
                .padding()
                .minimumScaleFactor(0.3)
        })
            .onAppear {
                if self.movie.posterImage != nil {
                    self.imageLoader.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w300" + self.movie.posterImage!)!)
                }
            }
    }
}

struct MoviePreview_Previews: PreviewProvider {
    
    static var previews: some View {
        MoviePreview(movie: MovieViewModel().movies[0])
    }
}


