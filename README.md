# SwiftUIWheelPicker

[![Version](https://img.shields.io/cocoapods/v/SwiftUIWheelPicker.svg?style=flat)](https://cocoapods.org/pods/SwiftUIWheelPicker)
[![License](https://img.shields.io/cocoapods/l/SwiftUIWheelPicker.svg?style=flat)](https://cocoapods.org/pods/SwiftUIWheelPicker)
[![Platform](https://img.shields.io/cocoapods/p/SwiftUIWheelPicker.svg?style=flat)](https://cocoapods.org/pods/SwiftUIWheelPicker)

Horizontal wheel picker for SwiftUI

## Requirements

iOS 13.0+

## Installation


### [CocoaPods](https://cocoapods.org)

```ruby
pod 'SwiftUIWheelPicker'
```

### Import

```swift
import SwiftUIWheelPicker
```

## Getting Started

### Basic use

![Basic Use](https://github.com/GGJJack/SwiftUIWheelPicker/blob/master/img/basic.gif?raw=true)

```swift
@State var indexBasic: Int = 5
@State var items: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

...

SwiftUIWheelPicker($indexBasic, items: $items) { value in
    GeometryReader { reader in
        Text("\(value)")
            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
    }
}
.frame(width: geometry.size.width - 40, height: 40, alignment: .center)
.padding(.top, 10)
```

### With Visible Count

![With Visible Count](https://github.com/GGJJack/SwiftUIWheelPicker/blob/master/img/with_visible_count.gif?raw=true)

```swift
SwiftUIWheelPicker($indexRatio, items: $items) { value in
    GeometryReader { reader in
        Text("\(value)")
            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
    }
}
.width(.Ratio(0.1))
```

```swift
public enum WidthOption {
    case VisibleCount(Int) // How many items to show on the display
    case Fixed(CGFloat) // to a fixed width
    case Ratio(CGFloat) // From the width of the view to the ratio
}
```

### With Alpha

![With Alpha](https://github.com/GGJJack/SwiftUIWheelPicker/blob/master/img/with_alpha.gif?raw=true)

```swift
SwiftUIWheelPicker($indexAlpha, items: $items) { value in
    GeometryReader { reader in
        Text("\(value)")
            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
    }
}
.scrollAlpha(0.1)
```

### With Scale

![With Scale](https://github.com/GGJJack/SwiftUIWheelPicker/blob/master/img/with_scale.gif?raw=true)

```swift
SwiftUIWheelPicker($indexScale, items: $items) { value in
    GeometryReader { reader in
        Text("\(value)")
            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
    }
}
.scrollScale(0.4)
```

### With Gradient

![With Scale](https://github.com/GGJJack/SwiftUIWheelPicker/blob/master/img/with_gradient.gif?raw=true)

```swift
SwiftUIWheelPicker($indexGradient, items: $items) { value in
    GeometryReader { reader in
        Text("\(value)")
            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
    }
}
.edgeLeft(AnyView(
    LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.4), Color.white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
), width: .Ratio(0.2))
.edgeRight(AnyView(
    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.gray.opacity(0.4)]), startPoint: .leading, endPoint: .trailing)
), width: .Ratio(0.2))
```

### Center indicator

![Center indicator](https://github.com/GGJJack/SwiftUIWheelPicker/blob/master/img/center_indicator.gif?raw=true)

```swift
SwiftUIWheelPicker($indexIndicator, items: $items) { value in
    GeometryReader { reader in
        Text("\(value)")
            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
    }
}
.centerView(AnyView(
    HStack(alignment: .center, spacing: 0) {
        Divider()
            .frame(width: 1)
            .background(Color.gray)
            .padding(EdgeInsets(top: 6, leading: 0, bottom: 6, trailing: 0))
            .opacity(0.4)
        Spacer()
        Divider()
            .frame(width: 1)
            .background(Color.gray)
            .padding(EdgeInsets(top: 6, leading: 0, bottom: 6, trailing: 0))
            .opacity(0.4)
    }
), width: .Fixed(40))
```

### Selected Value

![Selected Value](https://github.com/GGJJack/SwiftUIWheelPicker/blob/master/img/selected_value.gif?raw=true)

```swift
@State var indexValue: Int = 5
@State var items: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Text("Selected Value : \(indexValue)").font(Font.title)
SwiftUIWheelPicker($indexValue, items: $items) { value in
    GeometryReader { reader in
        Text("\(value)")
            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
            .background(value % 2 == 0 ? Color.blue.opacity(0.4) : Color.green.opacity(0.4))
    }
}
```

### Scroll To

![Scroll To](https://github.com/GGJJack/SwiftUIWheelPicker/blob/master/img/scroll_to.gif?raw=true)

```swift
HStack(alignment: .bottom, spacing: 20) {
    Text("Scroll To ").font(Font.title)
    Spacer()
    Button("First") {
        indexScrollTo = 0
    }
    Button("Center") {
        indexScrollTo = items.count / 2
    }
    Button("Last") {
        indexScrollTo = items.count - 1
    }
}
SwiftUIWheelPicker($indexScrollTo, items: $items) { value in
    GeometryReader { reader in
        Text("\(value)")
            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
            .background(value % 2 == 0 ? Color.blue.opacity(0.4) : Color.green.opacity(0.4))
    }
}
```

## Author

ggaljjak, ggaljjak.choi@gmail.com

## License

SwiftUIWheelPicker is available under the MIT license. See the LICENSE file for more info.
