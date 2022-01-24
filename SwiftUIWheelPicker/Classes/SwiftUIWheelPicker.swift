
import SwiftUI

public enum WidthOption {
    case VisibleCount(Int)
    case Fixed(CGFloat)
    case Ratio(CGFloat)
}
//SwiftUICustomSlider
public struct SwiftUIWheelPicker<Content: View, Item>: View {
    
    private var items: Binding<[Item]>
    let contentBuilder: (Item) -> Content
    @Binding var position: Int
    @GestureState private var translation: CGFloat = 0
    private var contentWidthOption: WidthOption = .VisibleCount(5)
    private var sizeFactor: CGFloat = 1
    private var alphaFactor: Double = 1
    private var edgeLeftView: AnyView? = nil
    private var edgeLeftWidth: WidthOption? = nil
    private var edgeRightView: AnyView? = nil
    private var edgeRightWidth: WidthOption? = nil
    private var centerView: AnyView? = nil
    private var centerViewWidth: WidthOption? = nil
    //private var isInfinite: Bool = false
    private var onValueChanged: ((Item) -> Void)? = nil
    
    public init(_ position: Binding<Int>, items: Binding<[Item]>, @ViewBuilder content: @escaping (Item) -> Content) {
        self.items = items
        self._position = position
        self.contentBuilder = content
    }
    
    public init(_ position: Binding<Int>, items: [Item], @ViewBuilder content: @escaping (Item) -> Content) {
        self.items = Binding.constant(items)
        self._position = position
        self.contentBuilder = content
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                HStack(spacing: 0) {
                    ForEach(0..<items.wrappedValue.count, id: \.self) { position in
                        drawContentView(position, geometry: geometry)
                    }
//                    ForEach(items.wrappedValue.indices) { position in
//                        drawContentView(position, geometry: geometry)
//                    }
                }
                .frame(width: geometry.size.width, alignment: .leading)
                .offset(x: -CGFloat(self.position + 1) * self.calcContentWidth(geometry, option: contentWidthOption))
                .offset(x: self.translation + (geometry.size.width / 2) + (self.calcContentWidth(geometry, option: contentWidthOption) / 2))
                .animation(.interactiveSpring(), value: self.position + 1)
                .animation(.interactiveSpring(), value: translation)
                .clipped()
                if let view = edgeLeftView, let width = edgeLeftWidth {
                    view.frame(width: calcContentWidth(geometry, option: width), height: geometry.size.height, alignment: .center)
                }
                if let view = edgeRightView, let widthOption = edgeRightWidth {
                    let width = calcContentWidth(geometry, option: widthOption)
                    view
                        .offset(x: geometry.size.width - width)
                        .frame(width: width, height: geometry.size.height, alignment: .center)
                }
                if let view = centerView, let widthOption = centerViewWidth {
                    let width = calcContentWidth(geometry, option: widthOption)
                    view
                        .offset(x: geometry.size.width / 2 - width / 2)
                        .frame(width: width, height: geometry.size.height, alignment: .center)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .contentShape(Rectangle())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.width
                }
                .onEnded { value in
                    let offset = value.translation.width / self.calcContentWidth(geometry, option: contentWidthOption)
                    let newIndex = (CGFloat(self.position) - offset).rounded()
                    self.position = min(max(Int(newIndex), 0), self.items.wrappedValue.count - 1)
                    self.onValueChanged?(items.wrappedValue[self.position])
                }
            )
        }
    }
    
    public func width(_ option: WidthOption) -> Self {
        var newSelf = self
        newSelf.contentWidthOption = option
        return newSelf
    }
    
    public func scrollAlpha(_ value: Double) -> Self {
        var newSelf = self
        newSelf.alphaFactor = value
        return newSelf
    }
    
    public func scrollScale(_ value: CGFloat) -> Self {
        var newSelf = self
        newSelf.sizeFactor = value
        return newSelf
    }
    
    public func edgeLeft(_ view: AnyView, width: WidthOption) -> Self {
        var newSelf = self
        newSelf.edgeLeftView = view
        newSelf.edgeLeftWidth = width
        return newSelf
    }
    
    public func edgeRight(_ view: AnyView, width: WidthOption) -> Self {
        var newSelf = self
        newSelf.edgeRightView = view
        newSelf.edgeRightWidth = width
        return newSelf
    }
    
    public func centerView(_ view: AnyView, width: WidthOption) -> Self {
        var newSelf = self
        newSelf.centerView = view
        newSelf.centerViewWidth = width
        return newSelf
    }
    
    //public func infiniteScroll(_ value: Bool) -> Self {
    //    var newSelf = self
    //    newSelf.isInfinite = value
    //    return newSelf
    //}
    
    public func onValueChanged(_ callback: @escaping (Item) -> Void) -> Self {
        var newSelf = self
        newSelf.onValueChanged = callback
        return newSelf
    }
    
    private func drawContentView(_ position: Int, geometry: GeometryProxy) -> some View {
        var sizeResult: CGFloat = 1
        var alphaResult: Double = 1
        
        if sizeFactor != 1.0 || alphaFactor != 1.0 {
            let maxRange = floor(maxVisible(geometry) / 2.0)
            let offset = translation / self.calcContentWidth(geometry, option: contentWidthOption)
            let newIndex = CGFloat(self.position) - offset
            let posGap = CGFloat(position) - newIndex
            //let posGap = CGFloat(position) - (newIndex.truncatingRemainder(dividingBy: CGFloat(self.items.wrappedValue.count)))
            var per = abs(posGap / maxRange)
            if 1.0 < per {
                per = 1.0
            }
            
            if sizeFactor != 1.0 {
                let sizeGap = 1.0 - sizeFactor
                let preSizeRst = per * sizeGap
                sizeResult = 1 - preSizeRst
            }
            
            if alphaFactor != 1.0 {
                let alphaGap = 1.0 - alphaFactor
                let preAlphaRst = Double(per) * alphaGap
                alphaResult = 1.0 - preAlphaRst
            }
        }
        
        let item = items.wrappedValue[position]
        return contentBuilder(item)
            .scaleEffect(sizeResult)
            .opacity(alphaResult)
            .frame(width: self.calcContentWidth(geometry, option: contentWidthOption), alignment: .center)
    }
    
    private func maxVisible(_ geometry: GeometryProxy) -> CGFloat {
        let visibleCount = geometry.size.width / self.calcContentWidth(geometry, option: contentWidthOption)
        return min(visibleCount, CGFloat(self.items.wrappedValue.count))
    }
    
    private func calcContentWidth(_ geometry: GeometryProxy, option: WidthOption) -> CGFloat {
        switch option {
        case .VisibleCount(let count):
            return geometry.size.width / CGFloat(count)
        case .Fixed(let width):
            return width
        case .Ratio(let ratio):
            return geometry.size.width * ratio
        }
    }
}

public struct ChildSizeReader<Content: View>: View {
    var size: Binding<CGSize>
    let content: () -> Content
    
    public init(size: Binding<CGSize>, content: @escaping () -> Content) {
        self.size = size
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            content()
                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: SizePreferenceKey.self, value: proxy.size)
                    }
                )
        }
        .onPreferenceChange(SizePreferenceKey.self) { preferences in
            self.size.wrappedValue = preferences
        }
    }
}

struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: Value = .zero
    
    static func reduce(value _: inout Value, nextValue: () -> Value) {
        _ = nextValue()
    }
}

struct SwiftUIWheelPickerView_Previews: PreviewProvider {
    
    @ViewBuilder static func preview() -> some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                SwiftUIWheelPicker(Binding.constant(5), items: Binding.constant([0, 1, 2, 3, 4, 5, 6, 7, 8 ,9, 10])) { value in
                    GeometryReader { reader in
                        Text("\(value)")
                            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                            .background(value % 2 == 0 ? Color.orange : Color.yellow)
                    }
                }
                .frame(width: geometry.size.width, height: 40, alignment: .center)
                
                SwiftUIWheelPicker(Binding.constant(5), items: Binding.constant([0, 1, 2, 3, 4, 5, 6, 7, 8 ,9, 10])) { value in
                    GeometryReader { reader in
                        Text("\(value)")
                            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                            .background(value % 2 == 0 ? Color.orange : Color.yellow)
                    }
                }
                .width(.VisibleCount(3))
                .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2.0))
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                
                SwiftUIWheelPicker(Binding.constant(5), items: Binding.constant([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])) { value in
                    GeometryReader { reader in
                        Text("\(value)")
                            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                            .background(value % 2 == 0 ? Color.orange : Color.yellow)
                    }
                }
                .width(.Fixed(30))
                .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                .border(Color.black, width: 1)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                
                SwiftUIWheelPicker(Binding.constant(5), items: Binding.constant([0, 1, 2, 3, 4, 5, 6, 7, 8 ,9, 10])) { value in
                    GeometryReader { reader in
                        Text("\(value)")
                            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                    }
                }
                .width(.Fixed(40))
                .edgeLeft(AnyView(
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
                ), width: .Ratio(0.2))
                .edgeRight(AnyView(
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.white.opacity(0.8)]), startPoint: .leading, endPoint: .trailing)
                ), width: .Ratio(0.2))
                .scrollAlpha(0.2)
                .scrollScale(0.6)
                .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2.0))
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
            }
            
        }
    }
    
    static var previews: some View {
        VStack(alignment: .center, spacing: 0) {
            preview()
        }
        .previewDevice(PreviewDevice(rawValue: "iPod touch (7th generation)"))
        VStack(alignment: .center, spacing: 0) {
            preview()
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}

