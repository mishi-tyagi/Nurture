//
//  PlantDataModel.swift
//  PlantSurvival
//
//  Created by GEU on 14/02/26.
//

import Foundation
import SwiftUI

struct Plant: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let image: String 
    let minTemp: Double 
    let maxTemp: Double 
    let humidityNeeded: String
    let lightRequirement: String
    let description: String
    let waterQuantity: String
    let wateringFrequency: String
    let fertilizerType: String
    let fertilizerDuration: String
}

let indoorPlants = [
    Plant(name: "Tulsi (Holy Basil)",
          image: "Tulsi",
          minTemp: 15, maxTemp: 40,
          humidityNeeded: "High",
          lightRequirement: "Full Sun",
          description: "A sacred medicinal herb essential in Indian homes for immunity and air purification.",
          waterQuantity: "250ml",
          wateringFrequency: "Every morning",
          fertilizerType: "Cow dung compost",
          fertilizerDuration: "Once a month"),
          
    Plant(name: "Snake Plant",
          image: "SnakePlant",
          minTemp: 12, maxTemp: 35,
          humidityNeeded: "Low",
          lightRequirement: "Any Light",
          description: "A hardy plant that converts CO2 into oxygen at night. Perfect for bedrooms.",
          waterQuantity: "150ml",
          wateringFrequency: "Every 10 days",
          fertilizerType: "N-P-K (10-10-10)",
          fertilizerDuration: "Every 6 months"),

    Plant(name: "Money Plant",
          image: "MoneyPlant",
          minTemp: 15, maxTemp: 35,
          humidityNeeded: "Medium",
          lightRequirement: "Indirect Sun",
          description: "A popular climber believed to bring prosperity. Grows well in both soil and water.",
          waterQuantity: "200ml",
          wateringFrequency: "Twice a week",
          fertilizerType: "Liquid seaweed",
          fertilizerDuration: "Once a month"),

    Plant(name: "Aloe Vera",
          image: "AloeVera",
          minTemp: 10, maxTemp: 45,
          humidityNeeded: "Low",
          lightRequirement: "Direct Sun",
          description: "A succulent known for its healing gel and ability to thrive with very little water.",
          waterQuantity: "100ml",
          wateringFrequency: "Once a week",
          fertilizerType: "Cactus fertilizer",
          fertilizerDuration: "Every 4 months"),

    Plant(name: "Areca Palm",
          image: "ArecaPalm",
          minTemp: 16, maxTemp: 32,
          humidityNeeded: "High",
          lightRequirement: "Bright Indirect",
          description: "A beautiful tropical palm that acts as a natural humidifier for your living room.",
          waterQuantity: "500ml",
          wateringFrequency: "Thrice a week",
          fertilizerType: "Slow-release grains",
          fertilizerDuration: "Twice a year"),

    Plant(name: "Rubber Plant",
          image: "RubberPlant",
          minTemp: 15, maxTemp: 30,
          humidityNeeded: "Medium",
          lightRequirement: "Bright Indirect",
          description: "Features thick, glossy dark leaves that add a bold look to any indoor corner.",
          waterQuantity: "300ml",
          wateringFrequency: "Once a week",
          fertilizerType: "Nitrogen-rich",
          fertilizerDuration: "Once a month"),

    Plant(name: "Fiddle Leaf Fig",
          image: "FiddleLeafFig",
          minTemp: 18, maxTemp: 24,
          humidityNeeded: "Medium",
          lightRequirement: "Bright Indirect",
          description: "The 'Diva' of houseplants. Beautiful but sensitive to drafts and temperature changes.",
          waterQuantity: "400ml",
          wateringFrequency: "Once a week",
          fertilizerType: "Fiddle Leaf treats",
          fertilizerDuration: "Every 2 weeks (Spring)"),

    Plant(name: "Calathea",
          image: "Calathea",
          minTemp: 18, maxTemp: 27,
          humidityNeeded: "Very High",
          lightRequirement: "Low Light",
          description: "Known as the Prayer Plant because it moves its leaves up at night and down by day.",
          waterQuantity: "200ml",
          wateringFrequency: "Every 3 days",
          fertilizerType: "Diluted Liquid",
          fertilizerDuration: "Once a month"),

    Plant(name: "Peace Lily",
          image: "PeaceLily",
          minTemp: 18, maxTemp: 28,
          humidityNeeded: "High",
          lightRequirement: "Low Light",
          description: "Produces elegant white flowers and droops its leaves to tell you when it is thirsty.",
          waterQuantity: "250ml",
          wateringFrequency: "Every 3 days",
          fertilizerType: "Standard Liquid",
          fertilizerDuration: "Every 6 weeks"),

    Plant(name: "Orchid",
          image: "Orchid",
          minTemp: 18, maxTemp: 28,
          humidityNeeded: "Very High",
          lightRequirement: "Filtered Light",
          description: "Exotic and delicate flowers that require precise care and stable temperatures.",
          waterQuantity: "50ml (Misting)",
          wateringFrequency: "Once a week",
          fertilizerType: "Orchid food",
          fertilizerDuration: "Every 2 weeks"),

    Plant(name: "Boston Fern",
          image: "BostonFern",
          minTemp: 16, maxTemp: 24,
          humidityNeeded: "Very High",
          lightRequirement: "Shade",
          description: "Loves moisture and looks stunning in hanging baskets. Needs regular misting.",
          waterQuantity: "400ml",
          wateringFrequency: "Every alternate day",
          fertilizerType: "Liquid Fern food",
          fertilizerDuration: "Once a month"),

    Plant(name: "English Ivy",
          image: "EnglishIvy",
          minTemp: 7, maxTemp: 21,
          humidityNeeded: "Medium",
          lightRequirement: "Medium Light",
          description: "A classic climber that actually prefers cooler room temperatures to tropical heat.",
          waterQuantity: "150ml",
          wateringFrequency: "Twice a week",
          fertilizerType: "Balanced 20-20-20",
          fertilizerDuration: "Once a month")
]

extension Color {
    static let natureGreen = Color(red: 0.2, green: 0.4, blue: 0.2)
    static let softSage = Color(red: 0.6, green: 0.75, blue: 0.6)
}
