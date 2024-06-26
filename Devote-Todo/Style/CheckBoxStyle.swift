//
//  CheckBoxStyle.swift
//  Devote-Todo
//
//  Created by SMIT KHOKHARIYA on 2024-03-25.
//

import SwiftUI

struct CheckBoxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack{
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded) )
                .onTapGesture {
                    configuration.isOn.toggle()
                    feedback.notificationOccurred(.success)
                    
                    if configuration.isOn {
                        playSound(sound: "sound-rise", type: "mp3")
                    } else {
                        playSound(sound: "spund-tap", type: "mp3")
                    }
                }
            
            configuration.label
            
        }//: HSTACK
    }
}

#Preview {
    Toggle("Placeholder label", isOn: .constant(false))
        .toggleStyle(CheckBoxStyle())
        .padding()
        .previewLayout(.sizeThatFits)
}
