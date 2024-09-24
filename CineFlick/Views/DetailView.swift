//
//  DetailView.swift
//  CineFlick
//
//  Created by Brandon Jones on 9/24/24.
//


import SwiftUI


struct DetailView: View {
   let movie: Movie
  
  var body: some View {
    
    
    Text(movie.title)
    
  }
}



#Preview {
  DetailView(movie: Movie.example)
}
