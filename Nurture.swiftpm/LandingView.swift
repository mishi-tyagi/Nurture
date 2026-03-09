//
//  LandingView.swift
//  PlantSurvival
//
//  Created by GEU on 14/02/26.
//

import SwiftUI

struct LandingView: View {
    @StateObject var weatherManager = WeatherManager()
    @State private var searchText = ""
    
    
    let themeGreen = Color(red: 0.2, green: 0.4, blue: 0.2)
    let backgroundSage = Color(red: 0.92, green: 0.96, blue: 0.92)
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
   
    var filteredPlants: [Plant] {
        if searchText.isEmpty {
            return indoorPlants
        } else {
            return indoorPlants.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundSage
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("My Green Space")
                                .font(.system(size: 34, weight: .bold, design: .rounded))
                                .foregroundColor(themeGreen)
                            
                            HStack {
                                Image(systemName: "thermometer.medium")
                                Text("\(Int(weatherManager.temperature ?? 22))°C in your area")
                            }
                            .font(.subheadline)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .cornerRadius(20)
                            .foregroundColor(themeGreen)
                        }
                        .padding(.horizontal)
                        
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            
                            TextField("Search plants...", text: $searchText)
                                .foregroundColor(.black)
                                .autocorrectionDisabled()
                            
                            if !searchText.isEmpty {
                                Button(action: { searchText = "" }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray.opacity(0.5))
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        
                       
                        if filteredPlants.isEmpty && !searchText.isEmpty {
                            VStack(spacing: 15) {
                                Spacer(minLength: 80)
                                Text("Oops! Result not found.")
                                    .font(.title2.bold())
                                    .foregroundColor(themeGreen)
                                
                                Text("We couldn't find '\(searchText)' in our garden.")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                
                                Button(action: { searchText = "" }) {
                                    Text("Clear Search")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 14)
                                        .padding(.horizontal, 45)
                                        .background(themeGreen)
                                        .clipShape(Capsule())
                                }
                                .padding(.top, 10)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 40)
                            
                        } else {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(filteredPlants) { plant in
                                    NavigationLink(destination: DetailView(plant: plant, currentTemp: weatherManager.temperature)) {
                                        VStack(alignment: .center, spacing: 0) {
                                            Image(plant.image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(height: 140)
                                                .clipped()
                                            
                                            Text(plant.name)
                                                .font(.system(size: 16, weight: .bold))
                                                .foregroundColor(themeGreen)
                                                .padding(.vertical, 14)
                                                .frame(maxWidth: .infinity)
                                                .background(Color.white)
                                        }
                                        .cornerRadius(20)
                                        .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 4)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top, 10)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
