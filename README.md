
## CineFlick - A SwiftUI Movie Search App

This is a simple SwiftUI app that allows users to search for movies using the OMDb API. The app demonstrates the use of various techniques and skills in SwiftUI and Combine.

### Key Features & Techniques: 🗝️

-   **SwiftUI for UI Development:**
    
    -   The app's user interface is built entirely using SwiftUI, showcasing the declarative and composable nature of SwiftUI views.
    -   It uses `List` to display the search results and `AsyncImage` to efficiently load and display movie posters from the network.
    -   The `.searchable` modifier is used to provide a built-in search bar functionality within the `List`.
-   **Combine for Data Handling and Asynchronous Operations:**
    
    -   The `HTTPClient` class uses Combine's `URLSession.dataTaskPublisher` to fetch movie data from the OMDb API.
    -   The `map`,  `decode`, and `eraseToAnyPublisher` operators are used to transform the network response into an array of `Movie` objects.
    -   Error handling is implemented using the `catch` operator to provide a default empty array in case of an error.
    -   A `CurrentValueSubject` is used to manage the search text input and trigger movie searches with debouncing.
-   **Model-View-ViewModel (MVVM) Architecture:**
    
    -   Although not explicitly stated, the code structure hints at an MVVM-like pattern.
    -   The `ContentView` acts as the View, responsible for rendering the UI.
    -   The `HTTPClient` can be seen as a simple ViewModel, handling the network requests and providing data to the View.
    -   The `Movie` struct serves as the Model, representing the movie data.
-   **Codable for JSON Parsing:**
    
    -   The `Movie` and `MovieResponse` structs conform to the `Codable` protocol, allowing them to be automatically encoded and decoded from JSON data.
    -   Custom `CodingKeys` are used in the `Movie` struct to map the JSON field names to the corresponding properties.
-   **Error Handling:**
    
    -   A custom `NetworkError` enum is defined to represent potential network-related errors.
    -   The `HTTPClient` handles invalid URLs and provides a default empty array in case of other errors during the network request.
-   **String Extension for URL Encoding:**
    
    -   A `String` extension provides a convenient `urlEncoded` property to properly encode search queries for use in the URL.

**Additional Notes**

-   The app uses a `Constants` struct (not shown in the provided code) to store the OMDb API key securely.
-   The `Movie` struct conforms to `Identifiable` to work seamlessly with SwiftUI's `List`.

This project serves as a practical example of how to build a simple yet functional app using SwiftUI and Combine, showcasing essential techniques for UI development, data fetching, and asynchronous programming in the Swift ecosystem.
