//
//  InsetFactView.swift
//  Africa
//
//  Created by Manoel Filho on 16/04/21.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: - Properties
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        
        GroupBox{
            
            TabView{
                
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
                
            }//: TABS
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
            
        }//:BOX
        
    }
}

//MARK: - Preview
struct InsetFactView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
