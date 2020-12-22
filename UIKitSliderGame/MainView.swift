//
//  MainView.swift
//  UIKitSliderGame
//
//  Created by User on 22.12.2020.
//

import SwiftUI

struct MainView: View {
    @State private var currentValue: Double = 20
    @State private var targetValue = Int.random(in: 0...100)
    @State private var isCheckAlert = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            
            SliderBar(currentValue: $currentValue,
                      alpha: CGFloat(computeScore()) / 100)
            
            Button("Проверь меня!") {
                isCheckAlert = true
            }
            .padding(10)
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
            .padding(10)
        }
        .padding()
        .alert(isPresented: $isCheckAlert) {
            Alert(title: Text("Your score"), message: Text("\(computeScore())"))
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
