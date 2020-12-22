//
//  SliderBar.swift
//  UIKitSliderGame
//
//  Created by User on 22.12.2020.
//

import SwiftUI

struct SliderBar: View {
    @Binding var currentValue: Double
    let alpha: CGFloat
    
    var body: some View {
        HStack {
            Text("0")
            UIKitSlider(currentValue: $currentValue, alpha: alpha)
            Text("100")
        }
    }
}

struct SliderBar_Previews: PreviewProvider {
    static var previews: some View {
        SliderBar(currentValue: .constant(30), alpha: 10)
    }
}
