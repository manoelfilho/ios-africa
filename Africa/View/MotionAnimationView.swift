//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Manoel Filho on 16/04/21.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - Properties
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    //MARK: - Function
    
    // 1. Randon coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // 2. Randon size
    func randonSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    // 3. Randon scale
    func randonScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4. Randon speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    // 5. Randon delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    /* func randomCircle()->Int{
        return Int.random(in: 12...16)
    } */
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randonSize(), height: randonSize(), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaleEffect(isAnimating ? randonScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }//:Loop
                .drawingGroup() //Better performance for animation
                
                //Text("With: \(Int(geometry.size.width)) Height: \(Int(geometry.size.height))")
            
            }//:ZStack
            
        }//:GeometryReader
    }
}

//MARK: - Preview
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
