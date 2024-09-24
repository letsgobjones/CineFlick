//
//  Movie.swift
//  CineFlick
//
//  Created by Brandon Jones on 9/24/24.
//

import Foundation

struct MovieResponse: Codable {
  let Search: [Movie]
}


struct Movie: Identifiable,Codable {
  let title: String
  let year: String
  let imdbId: String
  let poster: URL?
  let plot: String?
  var id: String {
    imdbId
  }
  
  
  private enum CodingKeys: String, CodingKey {
    case title = "Title"
    case year = "Year"
    case imdbId = "imdbID"
    case poster = "Poster"
    case plot = "Plot"
  }
}




extension Movie {
  static var example: Movie { Movie(title: "Batman", year: "1989", imdbId: "tt0096895", poster: URL(string: "https://m.media-amazon.com/images/M/MV5BZWQ0OTQ3ODctMmE0MS00ODc2LTg0ZTEtZWIwNTUxOGExZTQ4XkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_SX300.jpg"), plot: "The Dark Knight of Gotham City begins his war on crime with his first major enemy being Jack Napier, a criminal who becomes the clownishly homicidal Joker.")
    
    
  }
}
//                                    plot: "The Dark Knight of Gotham City begins his war on crime with his first major enemy being Jack Napier, a criminal who becomes the clownishly homicidal Joker.")
