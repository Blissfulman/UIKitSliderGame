//
//  UIKitSlider.swift
//  SwiftUIColorizedApp
//
//  Created by Alexey Efimov on 20.12.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct UIKitSlider: UIViewRepresentable {
    @Binding var currentValue: Double
    let alpha: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor(displayP3Red: 1,
                                        green: 0,
                                        blue: 0,
                                        alpha: alpha)
    }
    
    func makeCoordinator() -> UIKitSlider.Coordinator {
        Coordinator(currentValue: $currentValue, alpha: alpha)
    }
}

extension UIKitSlider {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        let alpha: CGFloat
        
        init(currentValue: Binding<Double>, alpha: CGFloat) {
            self._currentValue = currentValue
            self.alpha = alpha
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSlider(currentValue: .constant(50), alpha: 0.7)
    }
}
