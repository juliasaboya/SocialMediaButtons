//
//  File.swift
//  
//
//  Created by Júlia Saboya on 12/06/24.
//

import Foundation
import SwiftUI

public extension View {
    func appearingLetters(duration: TimeInterval, startAnimation: Binding<Bool>) -> some View {
        self
            .modifier(AppearingLetters(duration: 1, startAnimation: startAnimation))
    }
}
public extension View {
    func pulseAnimation(duration: TimeInterval, startAnimation: Binding<Bool>) -> some View {
        self
            .modifier(ScaleAnimation(duration: 1, startKeyAnimation: startAnimation))
    }
}

//TODO: completar os outros modifiers


public extension View {
    func boingEffect(duration: TimeInterval, startAnimation: Binding<Bool>) -> some View {
        self
            .modifier(HorizontalStretch(duration: 1, startAnimation: startAnimation))
            .modifier(VerticalStretch(duration: 1, startAnimation: startAnimation))
    }
}

public extension View {
    func movingLogo(duration: TimeInterval, startAnimation: Binding<Bool>) -> some View {
        self
            .modifier(MovingLogo(duration: 1, startAnimation: startAnimation))
    }
}
