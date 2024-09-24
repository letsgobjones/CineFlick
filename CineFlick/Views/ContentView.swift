//
//  ContentView.swift
//  CineFlick
//
//  Created by Brandon Jones on 9/24/24.
//

import SwiftUI
import Combine
struct ContentView: View {
  
  @State private var movies: [Movie] = []
  @State private var search: String = ""
  
  private let httpClient: HTTPClient
  
  private var searchSubject = CurrentValueSubject<String, Never>("")
  
  @State private var cancellables: Set<AnyCancellable> = []
  
  init(httpClient: HTTPClient) {
    self.httpClient = httpClient
  }
  
  var body: some View {
      List(movies) { movie in
        HStack {
          AsyncImage(url: movie.poster) { image in
            image.resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 75, height: 75)
            
          } placeholder: {
            ProgressView()
          }
          Text(movie.title)
        }
      }
      
      .onAppear(perform: setupSearchPublisher)
      .searchable(text: $search)
      .onChange(of: search) {
        searchSubject.send(search)
      }
    }
  }


#Preview {
  NavigationStack {
    ContentView(httpClient: HTTPClient())
  }
}

extension ContentView {
  private func loadMovies(search: String) {
   httpClient.fetchMovies(search: search)
      .sink { _ in
      } receiveValue: { movies in
        self.movies = movies
      }.store(in: &cancellables)
  }
  
  private func setupSearchPublisher() {
    searchSubject
      .debounce(for: 0.5, scheduler: DispatchQueue.main)
      .sink { searchText in
        loadMovies(search: searchText)
      }.store(in: &cancellables)
  }
}
