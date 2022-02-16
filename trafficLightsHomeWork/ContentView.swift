//
//  ContentView.swift
//  trafficLightsHomeWork
//
//  Created by Дмитрий on 15.02.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    @State private var currentLight = CurrentLight.red
    @State private var redOpacity = 0.3
    @State private var yellowOpacity = 0.3
    @State private var greenOpacity = 0.3
    @State private var changeText = false
    @State private var buttonTitle = "START"
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack {
                ColorCircle(color: .red).opacity(redOpacity)
                ColorCircle(color: .yellow).opacity(yellowOpacity)
                ColorCircle(color: .green).opacity(greenOpacity)
                Spacer()
                Button(action: {
                    buttonTitle = "NEXT"
                    switch currentLight {
                    case .red:
                        redOpacity = 1.0
                        greenOpacity = 0.3
                        currentLight = .yellow
                    case .yellow:
                        yellowOpacity = 1.0
                        redOpacity = 0.3
                        currentLight = .green
                    case .green:
                        greenOpacity = 1.0
                        yellowOpacity = 0.3
                        currentLight = .red
                    }
                    
                }) {
                    Text("\(buttonTitle)")
                        .font(.title)
                        .font(.system(size: 17))
                        .frame(width: 150, height: 40)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.white, lineWidth: 3))
                }
            }
            .padding(70)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
