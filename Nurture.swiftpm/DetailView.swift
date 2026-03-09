//
//  DetailView.swift
//  PlantSurvival
//
//  Created by GEU on 14/02/26.
//

import SwiftUI

struct DetailView: View {
    let plant: Plant
    let currentTemp: Double?
    
    // Unified theme green
    let themeGreen = Color(red: 0.2, green: 0.4, blue: 0.2)
    
    var thrives: Bool {
        let temp = currentTemp ?? 22.0
        return temp >= plant.minTemp
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    // 1. SHORTENED PLANT IMAGE
                    Image(plant.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300) // Shortened height as requested
                        .frame(maxWidth: .infinity)
                        .cornerRadius(32)
                        .clipped()
                        .padding(.horizontal, 15)
                        .padding(.top, 10)
                    
                    // 2. PLANT NAME CARD (Placed below the image)
                    VStack(alignment: .leading) {
                        Text(plant.name)
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 25)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(themeGreen.opacity(0.8)) // Using theme color with opacity for the gray/green texture
                    .background(.ultraThinMaterial) // Frosted glass effect
                    .cornerRadius(24)
                    .padding(.horizontal, 15)
                    
                    // 3. INFORMATION CONTENT
                    VStack(alignment: .leading, spacing: 30) {
                        
                        // Survival Badge
                        HStack {
                            Image(systemName: thrives ? "checkmark.circle.fill" : "exclamationmark.triangle.fill")
                            Text(thrives ? "Thrives in your location" : "Needs extra care")
                        }
                        .font(.subheadline.bold())
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .background(thrives ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                        .foregroundColor(thrives ? .green : .red)
                        .clipShape(Capsule())
                        .frame(maxWidth: .infinity)
                        
                        // 4. PLANT METRICS (All Green)
                        HStack(spacing: 15) {
                            MetricView(title: "\(Int(plant.minTemp))°C", label: "Ideal Min", icon: "thermometer.medium", color: themeGreen)
                            MetricView(title: plant.lightRequirement, label: "Light", icon: "sun.max.fill", color: themeGreen)
                            MetricView(title: plant.humidityNeeded, label: "Humidity", icon: "drop.fill", color: themeGreen)
                        }
                        .padding(.horizontal)

                        // Description
                        Text("This \(plant.name) thrives best in \(plant.lightRequirement) light. It requires a \(plant.humidityNeeded) humidity environment to maintain its vibrant health.")
                            .font(.system(size: 16))
                            .lineSpacing(6)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                        
                        // 5. CARE ROUTINE (Left-Aligned)
                        VStack(alignment: .leading, spacing: 25) {
                            Label("Care Routine", systemImage: "calendar")
                                .font(.headline)
                                .foregroundColor(themeGreen)
                                .padding(.bottom, 5)
                            
                            CareRowFull(icon: "drop.fill", title: "Watering", value: plant.waterQuantity, color: themeGreen)
                            CareRowFull(icon: "clock.fill", title: "Watering Frequency", value: plant.wateringFrequency, color: themeGreen)
                            CareRowFull(icon: "leaf.fill", title: "Fertilizer", value: plant.fertilizerType, color: themeGreen)
                            CareRowFull(icon: "timer", title: "Fertilizing Schedule", value: plant.fertilizerDuration, color: themeGreen)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Sub-components (Keep these at the bottom of the file)
struct MetricView: View {
    let title: String; let label: String; let icon: String; let color: Color
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon).font(.system(size: 18)).foregroundColor(color)
            Text(title).font(.system(size: 16, weight: .bold))
            Text(label).font(.caption).foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
    }
}

struct CareRowFull: View {
    let icon: String; let title: String; let value: String; let color: Color
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon).foregroundColor(color).font(.system(size: 22)).frame(width: 30)
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.caption).foregroundColor(.gray)
                Text(value).font(.system(size: 16, weight: .bold)).foregroundColor(.black)
            }
            Spacer()
        }
    }
}
