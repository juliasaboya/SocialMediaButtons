//
//  SwiftUIView.swift
//  
//
//  Created by Júlia Saboya on 12/06/24.
//

import SwiftUI

public struct MovingLogo: ViewModifier {
    public let duration: TimeInterval
    @Binding var startAnimation: Bool
    public init(duration: TimeInterval, startAnimation: Binding<Bool>) {
        self.duration = duration
        self._startAnimation = startAnimation
    }
    public func body(content: Content) -> some View {
        content
            .keyframeAnimator(initialValue: Properties(), trigger: startAnimation){ view, frame in
                view
                    .offset(x: frame.offsetX)
            } keyframes:{ _ in
                KeyframeTrack(\.offsetX){
                    CubicKeyframe(170, duration: 1)

                }
            }

    }
}


