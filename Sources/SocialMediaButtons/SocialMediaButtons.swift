import SwiftUI



public struct MetamorfoseView: View {

    @State private var startShakeAnimation: Bool = false
    @State private var startScaleAnimation: Bool = false
    @State private var startUpDownAnimation: Bool = false
    @State private var startQShakeAnimation: Bool = false
    @State private var startQuickestShakeAnimation: Bool = false
    @State private var startVerticalStretch: Bool = false
    @State private var startHorizontalStretch: Bool = false


    var shouldFill: Bool = false
    var changePhoto: Bool = false


    public var iconName: String
    public var iconColor: Color

    public init(iconName: String, iconColor: Color) {
        self.iconName = iconName
        self.iconColor = iconColor
    }
    var image: Image {
        changePhoto ? Image(systemName: "heart"): Image(systemName: "heart.fill")
    }

    var icon: String {
        startShakeAnimation ? iconName+".fill" : iconName
    }

    public var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
            .modifier(VerticalStretch(duration: 1, startAnimation: $startVerticalStretch))
            .modifier(HorizontalStretch(duration: 1, startAnimation: $startHorizontalStretch))
            .onTapGesture {
                Task {

//                    startQShakeAnimation.toggle()
//                    try? await Task.sleep(for: .seconds(1))
                    startVerticalStretch.toggle()
                    startHorizontalStretch.toggle()
                }
            }
    }
}

#Preview {
    MetamorfoseView(iconName: "heart", iconColor: .black)
}
