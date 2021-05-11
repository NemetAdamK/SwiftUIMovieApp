//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Ádám-Krisztián Német on 11.05.2021.
//

import SwiftUI

@main
struct MovieAppApp: App {
    @State static var searchText = ""
    var body: some Scene {
        WindowGroup {
            ContentView(searchText: MovieAppApp.searchText, viewState: MovieViewModel())
        }
    }
}
