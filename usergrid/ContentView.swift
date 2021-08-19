//
//  ContentView.swift
//  usergrid
//
//  Created by Andres Becerra on 19/08/21.
//

import SwiftUI

struct ContentView: View {
    
    let items = Array(1...10).map({"image\($0)"})
    
    let layout = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 120))
    ]
    
    
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical){
                LazyVGrid(columns: layout, content: {
                    ForEach(items, id: \.self) { item in
                        
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .border(Color.secondary)
                            .cornerRadius(4)
                            .padding()
                        
                    }
                })
                
                
            }
            
        }
        
        
    }
    
    
    
} // end View




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
