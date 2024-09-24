//
//  HTTPClient.swift
//  CineFlick
//
//  Created by Brandon Jones on 9/24/24.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case invalidStatusCode
}

class HTTPClient {
  
  func fetchMovies(search: String) -> AnyPublisher<[Movie], Error> {
    
    guard let encodedSearch = search.urlEncoded,
          let url = URL(string: "https://www.omdbapi.com/?s=\(encodedSearch)&apikey=\(Constants.Keys.omdbAPIKey)") else {
      return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .decode(type: MovieResponse.self, decoder: JSONDecoder())
      .map { $0.Search }
      .receive(on: DispatchQueue.main)
      .catch { error -> AnyPublisher<[Movie], Error> in
        return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
      }
          .eraseToAnyPublisher()
      }
  }
