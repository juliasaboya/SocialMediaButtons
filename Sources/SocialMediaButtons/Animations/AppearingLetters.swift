//
//  SwiftUIView.swift
//  
//
//  Created by Júlia Saboya on 12/06/24.
//

import SwiftUI

public struct AppearingLetters: ViewModifier {
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
                    SpringKeyframe(1.5, duration: 0.5, spring: .bouncy)
                    SpringKeyframe(1, duration: 0.2, spring: .bouncy)
                }
            }
    }
}
