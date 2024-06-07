//
//  SwiftUIView.swift
//
//
//  Created by Júlia Saboya on 05/06/24.
//

import SwiftUI

struct ShakeAnimation: ViewModifier {

    //    enum `Type` {
    //        case toggleFill
    //        case `default`
    //    }

    let duration: TimeInterval
    @Binding var startKeyAnimation: Bool
    let iconColor: Color
    func body(content: Content) -> some View {
        content
            .keyframeAnimator(initialValue: Keyframe(), trigger: startKeyAnimation) { view, frame in
                // editando a dita cuja
                view
                    .offset(x: frame.offsetX, y: frame.offsetY)
                    .rotationEffect(frame.rotation, anchor: .bottom)
            } keyframes: { _ in
                KeyframeTrack(\.offsetX) {
                    CubicKeyframe(7, duration: 0.05)
                    CubicKeyframe(-7, duration: 0.05)
                    CubicKeyframe(7, duration: 0.05)
                    CubicKeyframe(-7, duration: 0.05)
                    CubicKeyframe(7, duration: 0.05)
                    CubicKeyframe(-7, duration: 0.05)
                    CubicKeyframe(0, duration: 0.05)
                }
                KeyframeTrack(\.rotation){
                    CubicKeyframe(.degrees(12.5), duration: 0.05)
                    CubicKeyframe(.degrees(-12.5), duration: 0.05)
                    CubicKeyframe(.degrees(10), duration: 0.05)
                    CubicKeyframe(.degrees(-10), duration: 0.05)
                    CubicKeyframe(.degrees(5), duration: 0.05)
                    CubicKeyframe(.degrees(-5), duration: 0.05)
                    CubicKeyframe(.degrees(0), duration: 0.05)
                }
            }
    }
}



