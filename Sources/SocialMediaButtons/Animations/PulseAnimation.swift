//
//  SwiftUIView.swift
//  
//
//  Created by Júlia Saboya on 05/06/24.
//

import SwiftUI

public struct ScaleAnimation: ViewModifier {
    var duration: TimeInterval
    @Binding var startKeyAnimation: Bool

    public init(duration: TimeInterval, startKeyAnimation: Binding<Bool>) {
        self.duration = duration
        self._startKeyAnimation = startKeyAnimation
    }
    public func body(content: Content) -> some View {
        content
            .keyframeAnimator(
                initialValue: Properties(),
                trigger: startKeyAnimation
            ) { view, frame in
                view
                    .scaleEffect(frame.scale)
            } keyframes: { prop in
                KeyframeTrack(\.scale) {
                    SpringKeyframe(1.3, duration: duration * 0.3, spring: .bouncy)
                    SpringKeyframe(0.75, duration: duration * 0.15, spring: .snappy)
                    SpringKeyframe(1.15, duration: duration * 0.15, spring: .bouncy)
                    SpringKeyframe(1.0, duration: duration * 0.3, spring: .smooth)
                }
            }
    }
}

struct Maracuja: View {
    
    @State var startKeyAnimation: Bool = false

    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .modifier(ScaleAnimation(duration: 3, startKeyAnimation: $startKeyAnimation))
        Spacer().frame(height: 100)
        Button {
            startKeyAnimation.toggle()
        } label: {
            Text("iniciar")
        }
    }
}

#Preview {
    Maracuja()
}
