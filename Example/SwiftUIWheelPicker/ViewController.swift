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
    @State var index: Int = 5
    @State var index2: Int = 5
    @State var index3: Int = 5
    @State var index4: Int = 5
    @State var index5: Int = 5
    @State var index6: Int = 5
    @State var index7: Int = 5
    @State var index8: Int = 5
    @State var items: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    var body: some View {
        //        NavigationView {
        //            List {
        //                NavigationLink(destination: BasicUseView()) {
        //                    Text("Basic use")
        //                }
        //                NavigationLink(destination: WithIndicatorView()) {
        //                    Text("With indicator")
        //                }
        //                NavigationLink(destination: WithAnimationView()) {
        //                    Text("With animation")
        //                }
        //            }
        //            .navigationBarTitle("Home")
        //        }
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                SwiftUIWheelPicker($index, items: $items) { value in
                    GeometryReader { reader in
                        Text("\(value)")
                            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                            .background(value % 2 == 0 ? Color.orange : Color.yellow)
                    }
                }
                .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                .border(Color.black, width: 1)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                SwiftUIWheelPicker($index2, items: $items) { value in
                    GeometryReader { reader in
                        Text("\(value)")
                            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                            .background(value % 2 == 0 ? Color.orange : Color.yellow)
                    }
                }
                .width(.Fixed(20))
                .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2.0))
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                
                SwiftUIWheelPicker($index3, items: $items) { value in
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
                
                SwiftUIWheelPicker($index4, items: $items) { value in
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
                
                SwiftUIWheelPicker($index5, items: $items) { value in
                    GeometryReader { reader in
                        Text("\(value)")
                            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                    }
                }
                .width(.VisibleCount(7))
                .scrollAlpha(0.2)
                .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2.0))
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                
                SwiftUIWheelPicker($index6, items: $items) { value in
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
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                
                SwiftUIWheelPicker($index7, items: $items) { value in
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
                .scrollScale(0.5)
                .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2.0))
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                
                SwiftUIWheelPicker($index8, items: $items) { value in
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
                .scrollAlpha(0.2)
                .scrollScale(0.5)
                .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2.0))
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
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


