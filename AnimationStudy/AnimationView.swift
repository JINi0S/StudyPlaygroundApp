//
//  AnimationView.swift
//  StudyPlaygroundApp
//
//  Created by Lee Jinhee on 2023/03/26.
//

import SwiftUI

struct AnimationView : View {
    @State var isShow: Bool = false
    @State var isSizeCircle: Double = 30
    @State var isPositionRectangle: Double = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white], startPoint: .top, endPoint: .bottom)
            VStack(spacing: 30) {
                VStack() {
                    Spacer()
                    Circle()
                        .size(width: isSizeCircle, height: isSizeCircle)
                        .frame(width: 300, alignment: .center)
                        .offset(x: 150 - isSizeCircle / 2.0 )
                        .foregroundColor(.pink)
                        .opacity(isShow ? 1.0 : 0.0)
                        .animation(.spring(dampingFraction: 0.11), value: isSizeCircle)
                        //.animation(.interpolatingSpring(mass: 0.1, stiffness: 10.1, damping: 0.1, initialVelocity: 0.1), value: isSizeCircle)
                        .onTapGesture {
                            isSizeCircle += 20
                        }
                    Spacer()
                    Rectangle()
                        .frame(width: 50, height: 50,alignment: .center)
                        .foregroundColor(.blue)
                        .opacity(isShow ? 1.0 : 0.0)
                        .position(x: isPositionRectangle)
                        .animation(.spring(dampingFraction: 0.3), value: isPositionRectangle)
                        .onTapGesture {
                            isPositionRectangle += 50
                        }
                    Spacer()
                }
                .frame(width: 300, height: 300)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                Button {
                    withAnimation(.easeInOut(duration: 1)){
                        isShow.toggle()
                    }
                } label: {
                    Text("Show")
                        .bold()
                        .font(.system(size: 36))
                        .frame(width: 200, height: 60)
                        .foregroundColor(.white)
                        .background(.cyan)
                        .cornerRadius(30)
                }    
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
