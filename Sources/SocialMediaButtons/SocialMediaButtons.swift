import SwiftUI

struct AnimatedButtons: View {
    @State private var startKeyAnimation: Bool = false
    var icon: String = "heart"
    var shouldFill: Bool = false
    var semaphore: Bool = true
    var body: some View {
        VStack {
            Button {
                startKeyAnimation.toggle()
            } label: {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .keyframeAnimator(initialValue: Keyframe(), trigger: startKeyAnimation) { view, frame in
                        // editando a dita cuja
                        view
                            .scaleEffect(frame.scale)
                            .rotationEffect(frame.rotation, anchor: .bottom)
                            .offset(y: frame.offsetY)
                        
                    } keyframes: { frame in
                        KeyframeTrack(\.scale){
                            SpringKeyframe(1.3, duration: 0.3, spring: .bouncy )
                            SpringKeyframe(0.75, duration: 0.15, spring: .snappy )
                            SpringKeyframe(1.15, duration: 0.15, spring: .bouncy )
                            SpringKeyframe(1.0, duration: 0.3, spring: .smooth)
                        }
                        KeyframeTrack(\.rotation){
                            
                                CubicKeyframe(.degrees(12.5), duration: 0.2)
                                CubicKeyframe(.degrees(-12.5), duration: 0.2)
                                CubicKeyframe(.degrees(10), duration: 0.2)
                                CubicKeyframe(.degrees(-10), duration: 0.2)
                                CubicKeyframe(.degrees(5), duration: 0.2)
                                CubicKeyframe(.degrees(-5), duration: 0.2)
                                CubicKeyframe(.degrees(0), duration: 0.3)
                            
                            

                        }
                    } .foregroundStyle(.red)
            }
            
        }
        .padding()
    }
}

struct Keyframe {
    var scale: CGFloat = 1
    var offsetY: CGFloat = 0
    var rotation: Angle = .zero
}


#Preview {
    AnimatedButtons()
}

// TODO: Estudar Closures




