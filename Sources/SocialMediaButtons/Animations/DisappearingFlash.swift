//
//  SwiftUIView.swift
//  
//
//  Created by Júlia Saboya on 12/06/24.
//

import SwiftUI

public struct DisappearingFlash: ViewModifier {
    public let duration: TimeInterval
    @Binding var startAnimation: Bool
    public init(duration: TimeInterval, startAnimation: Binding<Bool>) {
        self.duration = duration
        self._startAnimation = startAnimation
    }

    public func body(content: Content) -> some View {
        content
            .keyframeAnimator(initialValue: Keyframe(scale: 0), trigger: startAnimation){ view, frame in
                view
                    .scaleEffect(frame.scale)
            } keyframes:{ _ in
                KeyframeTrack(\.scale){
                    MoveKeyframe(1)
                    SpringKeyframe(0.1, duration: 0.2, spring: .bouncy)
                    SpringKeyframe(0, duration: 0.1, spring: .bouncy)

                }
            }
    }
}
