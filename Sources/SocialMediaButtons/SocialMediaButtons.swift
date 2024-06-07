import SwiftUI

struct Keyframe {
    var scale: CGFloat = 1
    var offsetX: CGFloat = 0
    var offsetY: CGFloat = 0
    var rotation: Angle = .zero
}

public struct MetamorfoseView: View {

    @State private var startShakeAnimation: Bool = false
    @State private var startScaleAnimation: Bool = false
    var shouldFill: Bool = false

    public var iconName: String
    public var iconColor: Color

    public init(iconName: String, iconColor: Color) {
        self.iconName = iconName
        self.iconColor = iconColor
    }

    var icon: String {
        startShakeAnimation ? iconName+".fill" : iconName
    }

    public var body: some View {
        Image(systemName: icon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
            .modifier(
                ShakeAnimation(
                    duration: 3,
                    startKeyAnimation: $startShakeAnimation,
                    iconColor: iconColor
                )
            )
            .modifier(
                ScaleAnimation(
                    duration: 1,
                    startKeyAnimation: $startScaleAnimation
                )
            ).onTapGesture {
                Task {
                    startShakeAnimation.toggle()
                    try? await Task.sleep(for: .seconds(1))
                    startScaleAnimation.toggle()
                }
            }
    }
}

#Preview {
    MetamorfoseView(iconName: "heart", iconColor: .black)
}
