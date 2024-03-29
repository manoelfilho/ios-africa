//
//  ContentView.swift
//  Africa
//
//  Created by Manoel Filho on 14/04/21.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActivated: Bool = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //MARK: - Functions
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        //print("Number of columns: \(gridColumn)")
        
        //TOOLBAR IMAGE
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    //MARK: - Body
    var body: some View {
        
        NavigationView{
            
            Group{
                
                if !isGridViewActivated {
                    
                    List{
                        
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        
                        ForEach(animals) {animal in
                            
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalListItemView(animal: animal)
                            }
                            
                        }
                        
                        CreditsView()
                            .modifier(CenterModifier())
                        
                    }
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                            ForEach(animals){ animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                    
                }//: LIST
                
            }//: GROUP
            
            .navigationBarTitle("Africa", displayMode: .large)
            
            .toolbar{
                
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        
                        Button(action: {
                            print("List view activeted")
                            isGridViewActivated = false
                            haptics.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActivated ? .primary : .accentColor)
                        }
                        
                        Button(action: {
                            print("Grid view activeted")
                            isGridViewActivated = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }){
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActivated ? .accentColor : .primary)
                        }
                    }
                }
                
            }
            
        }//: NAVIGATION
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
