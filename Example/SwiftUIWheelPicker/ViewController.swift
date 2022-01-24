//
//  ViewController.swift
//  SwiftUIWheelPicker
//
//  Created by ggaljjak on 09/16/2021.
//  Copyright (c) 2021 ggaljjak. All rights reserved.
//

import UIKit
import SwiftUI
import SwiftUIWheelPicker

struct MainView: View {
    @State var indexBasic: Int = 5
    @State var indexRatio: Int = 5
    @State var indexAlpha: Int = 5
    @State var indexScale: Int = 5
    @State var indexGradient: Int = 5
    @State var indexIndicator: Int = 5
    @State var indexValue: Int = 5
    @State var indexScrollTo: Int = 5
    @State var items: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Basic").font(Font.title).padding(.top, 20)
                        SwiftUIWheelPicker($indexBasic, items: $items) { value in
                            GeometryReader { reader in
                                Text("\(value)")
                                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                            }
                        }
                        .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                        .padding(.top, 10)
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(alignment: .bottom, spacing: 0) {
                            Text("With Visible Count ").font(Font.title)
                            Text("(Ratio)").font(Font.body)
                        }
                        SwiftUIWheelPicker($indexRatio, items: $items) { value in
                            GeometryReader { reader in
                                Text("\(value)")
                                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                            }
                        }
                        .width(.Ratio(0.1))
                        .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2.0))
                        .padding(.top, 10)
                    }
                    .padding(.top, 30)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("With Alpha").font(Font.title)
                        SwiftUIWheelPicker($indexAlpha, items: $items) { value in
                            GeometryReader { reader in
                                Text("\(value)")
                                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                            }
                        }
                        .width(.VisibleCount(7))
                        .scrollAlpha(0.1)
                        .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2.0))
                        .padding(.top, 10)
                    }
                    .padding(.top, 30)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("With Scale").font(Font.title)
                        SwiftUIWheelPicker($indexScale, items: $items) { value in
                            GeometryReader { reader in
                                Text("\(value)")
                                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                            }
                        }
                        .width(.VisibleCount(7))
                        .scrollScale(0.4)
                        .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2.0))
                        .padding(.top, 10)
                    }
                    .padding(.top, 30)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("With Gradient").font(Font.title)
                        SwiftUIWheelPicker($indexGradient, items: $items) { value in
                            GeometryReader { reader in
                                Text("\(value)")
                                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                            }
                        }
                        .width(.Fixed(40))
                        .edgeLeft(AnyView(
                            LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.4), Color.white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
                        ), width: .Ratio(0.2))
                        .edgeRight(AnyView(
                            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.gray.opacity(0.4)]), startPoint: .leading, endPoint: .trailing)
                        ), width: .Ratio(0.2))
                        .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2.0))
                        .padding(.top, 10)
                    }
                    .padding(.top, 30)
                    
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Center indicator").font(Font.title)
                        SwiftUIWheelPicker($indexIndicator, items: $items) { value in
                            GeometryReader { reader in
                                Text("\(value)")
                                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                            }
                        }
                        .width(.Fixed(40))
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
                        .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2.0))
                        .padding(.top, 10)
                    }
                    .padding(.top, 30)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Selected Value : \(indexValue)").font(Font.title)
                        SwiftUIWheelPicker($indexValue, items: $items) { value in
                            GeometryReader { reader in
                                Text("\(value)")
                                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                                    .background(value % 2 == 0 ? Color.blue.opacity(0.4) : Color.green.opacity(0.4))
                            }
                        }
                        .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                        .border(Color.black, width: 1)
                        .padding(.top, 10)
                    }
                    .padding(.top, 30)
                    
                    VStack(alignment: .leading, spacing: 0) {
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
                        .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2.0))
                        .padding(.top, 10)
                    }
                    .padding(.top, 30)
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 40, trailing: 20))
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice(PreviewDevice(rawValue: "iPod touch (7th generation)"))
        MainView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        let contentViewController = UIHostingController(rootView: MainView())
        contentViewController.navigationController?.isNavigationBarHidden = true
        self.addChildViewController(contentViewController)
        self.view.addSubview(contentViewController.view)
        contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


