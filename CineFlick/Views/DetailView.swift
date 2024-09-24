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
    VStack {
      Text(movie.title)
        .font(.largeTitle)
      Text(movie.year)
        .font(.title)
      AsyncImage(url: movie.poster) { image in
        image
          .resizable()
          .scaledToFit()
        
      } placeholder: {
        ProgressView()
      }
      Spacer()
      VStack {
        
      }
      Text("IMBD ID: \(movie.imdbId)")
      
      Text(movie.plot ?? "")
    }
    .padding()
  }
  }




#Preview {
  DetailView(movie: Movie.example)
}
