//
//  HideKeyboardExtension.swift
//  Devote-Todo
//
//  Created by SMIT KHOKHARIYA on 2024-03-22.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard(){
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from : nil, for: nil)
        }
    }
#endif
