//
//  BMI.swift
//  BMI Calculator
//
//  Created by Alexandre Moreau-Lemay on 29/01/2021.
//  Copyright © 2021 Alexandre Moreau-Lemay. All rights reserved.
//

import UIKit

struct BMI {
    var height: Float = 1.50
    var weight: Float = 100
    var bmiValue: Float = 0.0
    var message: String?
    var bgColor: UIColor = .systemGreen
    
    init() {
        // Initialise with no parameters
        
        self.calculateBmi()
    }
    
    init(h: Float, w: Float) {
        // Initialise with starting parameters
        
        self.height = h
        self.weight = w
        self.calculateBmi()
    }
    
    mutating func calculateBmi() {
        if weight > 0 {
            // Prevent crash since it could otherwise result in a division by 0
            
            bmiValue = weight / Float(pow(Double(height), 2))
        } else {
            bmiValue = 0
        }
        messageModif()
    }
    
    mutating func updateHeight(_ h: Float) {
        height = h
        calculateBmi()
    }
    
    mutating func updateWeigth(_ w: Float) {
        weight = w
        calculateBmi()
    }
    
    mutating func messageModif() {
        switch self.bmiValue {
        case 0..<15:
            self.bgColor = .systemIndigo
            self.message = "Very severely underweight"
        case 15..<16:
            self.bgColor = .systemIndigo
            self.message = "Severely underweight"
        case 16..<18.5:
            self.bgColor = .systemIndigo
            self.message = "Underweight"
        case 18.5..<25:
            self.bgColor = .systemGreen
            self.message = "Normal weight"
        case 25..<30:
            self.bgColor = .systemOrange
            self.message = "Overweight"
        case 30..<35:
            self.bgColor = .systemRed
            self.message = "Obese class I"
        case 35..<40:
            self.bgColor = .systemRed
            self.message = "Obese class II"
        case 40...:
            self.bgColor = .systemRed
            self.message = "Obese class III"
        default:
            self.bgColor = .systemRed
            self.message = "Severely underweight"
        }
    }
}
