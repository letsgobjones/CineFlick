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
