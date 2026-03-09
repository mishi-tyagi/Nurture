//
//  PlantCard.swift
//  PlantSurvival
//
//  Created by GEU on 14/02/26.
//

import SwiftUI

struct PlantCard: View {
    let plant: Plant
    
    var body: some View {
        VStack(spacing: 0) {
            
            Image(plant.image)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
            
           
            Text(plant.name)
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.natureGreen)
                .padding(.vertical, 12)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.9)) 
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.natureGreen.opacity(0.1), lineWidth: 1)
        )
    }
}
