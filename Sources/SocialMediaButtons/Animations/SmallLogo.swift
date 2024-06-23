//
//  SwiftUIView.swift
//  
//
//  Created by Júlia Saboya on 12/06/24.
//

import SwiftUI

public struct SmallLogo: ViewModifier {
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
                    .scaleEffect(frame.scale)
            } keyframes:{ _ in
                KeyframeTrack(\.scale){
                    CubicKeyframe(2/3, duration: 1)

                }
            }

    }
}


