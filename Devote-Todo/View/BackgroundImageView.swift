//
//  BackgroundImageView.swift
//  Devote-Todo
//
//  Created by SMIT KHOKHARIYA on 2024-03-22.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
        }
}

#Preview {
    BackgroundImageView()
}
