//
//  WeatherManager.swift
//  PlantSurvival
//
//  Created by GEU on 14/02/26.
//

import Foundation
import CoreLocation
import Combine

@MainActor
class WeatherManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var temperature: Double?
    @Published var locationName: String = "Detecting..."

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    // This updates every time the phone detects a location change
    nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        Task { @MainActor in
            // Stop updating to save battery once we have the location
            self.locationManager.stopUpdatingLocation()
            await fetchRealWeather(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        }
    }

    func fetchRealWeather(lat: Double, lon: Double) async {
        // 1. Insert the actual API Key here
        let apiKey = "YOUR_OPENWEATHER_API_KEY"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Check if the server actually sent a 200 OK response
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
            
            // Success: Update the UI with real-time data
            self.temperature = decodedResponse.main.temp
            self.locationName = decodedResponse.name
            print("Real-time weather fetched: \(decodedResponse.main.temp)°C")
            
        } catch {
            print("Weather fetch failed: \(error.localizedDescription)")
            
            // If the fetch fails (due to no API key or no internet),
            // it defaults to this value. This is why you see 22°C.
            self.temperature = 22.0
            self.locationName = "Dehradun (Simulated)"
        }
    }
}

// Data structures for the OpenWeather API
struct WeatherResponse: Codable, Sendable {
    let main: MainWeather
    let name: String
}

struct MainWeather: Codable, Sendable {
    let temp: Double
}
