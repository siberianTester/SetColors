//
//  ContentView.swift
//  SetColors
//
//  Created by Yaroslav Malygin on 02.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    private let sliderNames = ["Red:", "Green:", "Blue:"]
    private var currentColor: Color {
        Color(
            red: redSliderValue / 255,
            green: greenSliderValue / 255,
            blue: blueSliderValue / 255
        )
    }
    
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            VStack(spacing: 20) {
                ColorizedView(color: currentColor)
                
                ColorSliderView(
                    sliderValue: $redSliderValue,
                    sliderColor: .red,
                    sliderName: sliderNames[0]
                )
                ColorSliderView(
                    sliderValue: $greenSliderValue,
                    sliderColor: .green,
                    sliderName: sliderNames[1]
                )
                ColorSliderView(
                    sliderValue: $blueSliderValue,
                    sliderColor: .blue,
                    sliderName: sliderNames[2]
                )
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct ColorSliderView: View {
    @Binding var sliderValue: Double
    let sliderColor: Color
    let sliderName: String
    
    var body: some View {
        HStack {
            Text(sliderName)
                .frame(width: 60, alignment: .leading)
                .foregroundStyle(.white)
            Text(lround(sliderValue).formatted())
                .frame(width: 35)
                .foregroundStyle(.white)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(sliderColor)
        }
    }
}

struct ColorizedView: View {
    let color: Color
    
    var body: some View {
        Text("")
            .frame(maxWidth: .infinity, maxHeight: 150)
            .background(color)
            .clipShape(.rect(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 3)
            )
    }
}
