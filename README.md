# StudyPlaygroundApp

# Animation 공부

1. State로 상태 나타낼 변수 생성 

'''
@State private var isSubscribed = false
'''

2. onTapGesture 안에 애니메이션 구현

'''
Image(systemName: isSubscribed ? "checkmark.circle.fill" : "circle")
  .scaleEffect(isSubscribed ? 1.25: 1.0)
  .foregroundColor(isSubscribed ? .green : .gray)
  .onTapGesture {
    withAnimation(.easeInOut(duration: 0.5)) {
      isSubscribed.toggle()
    }
}
'''
