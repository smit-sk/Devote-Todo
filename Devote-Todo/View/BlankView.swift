//
//  BlankView.swift
//  Devote-Todo
//
//  Created by SMIT KHOKHARIYA on 2024-03-23.
//

import SwiftUI

struct BlankView: View {
    var backgroundColor: Color
    var backroundOpacity: Double
    
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor)
        .opacity(backroundOpacity)
        .blendMode(.overlay)
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    BlankView(backgroundColor: Color.black, backroundOpacity: 0.3)
        .background(BackgroundImageView())
        .background(backgroundGradient.ignoresSafeArea(.all))
}
