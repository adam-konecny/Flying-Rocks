# Flying Rocks

## 🚀 About the App
Flying Rocks is an iOS application that showcases a list and map of meteorites from a remote data source. The app is designed to demonstrate modern development techniques in SwiftUI.

### Features:
* List View:
  * Displays meteorites with details like name, mass, coordinates, and discovery date.
  * Supports infinite scrolling and pull-to-refresh functionality.
  * Each item links to a detailed view.
* Map View:
  * Visualizes meteorite locations in the Czech Republic.
  * When location is enabled the map shows meteorites around you. 
  * Tap a pin to view detailed information about a meteorite.
 
## 🛠️ Tech Stack & Tools
* SwiftUI: For building the user interface.
* async/await: For managing asynchronous events.
* Modularization: Some features are in a separate module.
* Networking: Using Alamofire for API calls.
* SwiftData: TODO.
* Architecture: MVVM where every View Model has it's own protocol and can be mocked for use in Previews.
* Unit tests using the new Swift Testing.

## 🎨 Design
* Supports Dark Mode.
* The app supports both portrait and landscape orientations on iPhone and iPad.
* Well, it could be worse. It wasn't a priority... 😅

## 🖼️ Screenshots
TODO

## 📋 API Information
This app uses a public API to fetch meteorite data.
API Documentation: [See here](https://dev.socrata.com/foundry/data.nasa.gov/y77d-th95)

## 📝 License
This project is licensed under the MIT License. See the LICENSE file for details.
