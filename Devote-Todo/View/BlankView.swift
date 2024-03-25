//
//  BlankView.swift
//  Devote-Todo
//
//  Created by SMIT KHOKHARIYA on 2024-03-23.
//

import SwiftUI

struct BlankView: View {
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.black)
        .opacity(0.5)
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    BlankView()
}
