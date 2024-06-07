//
//  SwiftUIView.swift
//  
//
//  Created by Júlia Saboya on 05/06/24.
//

import SwiftUI

struct ScaleAnimation: ViewModifier {
    let duration: TimeInterval
    @Binding var startKeyAnimation: Bool
    func body(content: Content) -> some View {
        content
            .keyframeAnimator(initialValue: Keyframe(), trigger: startKeyAnimation) { view, frame in
                view
                    .scaleEffect(frame.scale)
            } keyframes: { _ in
                KeyframeTrack(\.scale){
                    SpringKeyframe(1.3, duration: 0.3, spring: .bouncy )
                    SpringKeyframe(0.75, duration: 0.15, spring: .snappy )
                    SpringKeyframe(1.15, duration: 0.15, spring: .bouncy )
                    SpringKeyframe(1.0, duration: 0.3, spring: .smooth)
                }
            }
    }
}
