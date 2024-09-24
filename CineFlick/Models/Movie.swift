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
  var id: String {
    imdbId
  }
  
  
  private enum CodingKeys: String, CodingKey {
    case title = "Title"
    case year = "Year"
    case imdbId = "imdbID"
    case poster = "Poster"
  }
}




extension Movie {
  static var example: Movie { Movie(title: "The Shawshank Redemption", year: "1994", imdbId: "tt0111161", poster: URL(string: "https://m.media-amazon.com/images/M/MV5BMTI4MjUxNjc0OV5BMl5BanBnXkFtZTcwODM0MTk2MQ@@._V1_SX300.jpg"))
    
    
  }
}
