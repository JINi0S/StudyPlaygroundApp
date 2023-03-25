import SwiftUI

struct ContentView: View {
    @State private var isSubscribed = false
    @State private var animatingCircle = false
    @State private var animatingButton = false
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .topLeading, endPoint: .bottomLeading)
            
            VStack(spacing: 50) {
                HStack {
                    Text("Subscribe to Me")
                        .bold()
                        .opacity(isSubscribed ? 1.0 : 0.5)
                    
                    Spacer()
                    
                    Image(systemName: isSubscribed ? "checkmark.circle.fill" : "circle")
                        .font(.system(size:24))
                        .scaleEffect(isSubscribed ? 1.25: 1.0)
                        .foregroundColor(isSubscribed ? .green : .gray)
                        .padding()
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                isSubscribed.toggle()
                            }
                        }
                }
                .padding()
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.linearGradient(colors: [.cyan, .green], startPoint: .topTrailing, endPoint: .bottomLeading))
                    .offset(x: animatingCircle ? 30 : 0, y: animatingCircle ? -100 : 0)
                    .scaleEffect(animatingCircle ? 2.0 : 1.0)
                    .onTapGesture {
                        withAnimation (.spring(response: 0.9, dampingFraction: 0.9)){
                            animatingCircle.toggle()
                        }
                    }
                
                Button {
                    withAnimation(.easeInOut(duration: 1).repeatCount(10)) {
                        animatingButton.toggle()
                    }
                    
                } label: {
                     Text("Animate")
                        .bold()
                        .frame(width: 200, height: 50)
                        .foregroundColor(.indigo)
                        .background(LinearGradient(colors: [.mint, .white], startPoint: .bottomTrailing, endPoint: .topTrailing))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(radius: 3)
                        .opacity(animatingButton ? 1.0 : 0.7)
                        .scaleEffect(animatingButton ? 1.5 : 1.0)
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}
