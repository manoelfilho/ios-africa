//
//  insetGalleryView.swift
//  Africa
//
//  Created by Manoel Filho on 14/04/21.
//

import SwiftUI

struct InsetGalleryView: View {
    
    //MARK: - Properties
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 15){
                
                ForEach(animal.gallery, id: \.self) { image in
                    
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
                
            }//:HSTACK
        }
    }
}

//MARK: - Preview
struct insetGalleryView_Previews: PreviewProvider {
    
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
