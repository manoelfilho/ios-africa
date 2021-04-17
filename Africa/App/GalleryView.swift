//
//  GalleryView.swift
//  Africa
//
//  Created by Manoel Filho on 14/04/21.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - Properties
    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // SIMPLE GRID DEFINITION
    /* let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ] */
    
    // EFFICIENT GRID DEFINITION
    // let gridLayout:[GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DINAMIC GRID DEFINITION
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - Body
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            //MARK: - IMAGE
            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 10))
            
            //MARK: - SLIDER
            Slider(value: $gridColumn, in: 2...4, step: 1)
                .padding(.horizontal)
                .onChange(of: gridColumn, perform: { value in
                    gridSwitch()
                })
            
            //MARK: - GRID
            VStack(alignment: .center, spacing: 30){
                
                LazyVGrid(
                    columns: gridLayout,
                    alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                    spacing: 10
                ){
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                    }
                    
                }//:GRID
                .animation(.easeInOut)
                .onAppear(perform: {
                    gridSwitch()
                })
                
            }//:VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
            
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}
//MARK: - Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
