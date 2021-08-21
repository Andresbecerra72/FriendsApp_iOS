//
//  ContentView.swift
//  usergrid
//
//  Created by Andres Becerra on 19/08/21.
//

import SwiftUI



struct MainView: View {
    
    // variables
    @State var pressed: Int = -1
    @State var userData: [User] = []
    
    
    // layout del Grid
    let layout = [
        GridItem(.adaptive(minimum: 400)),
        //GridItem(.flexible(minimum: 400))
    ]
    
    
    
    var body: some View {
        
       //NavigationView{
      
        VStack {
            
            Text("My Friends")
                .font(.largeTitle)
                .foregroundColor(Color(hue: 0.511, saturation: 0.955, brightness: 0.624))
                .italic()
             
            
            ZStack {
                ScrollView(.vertical){
        
                        LazyVGrid(columns: layout, content: {
                            ForEach(userData, id: \.location.street.number) { item in
                                //NavigationLink(destination: UserView()){
                                CardView(pressed: .constant(-1), user: item)
                                        .gesture(TapGesture()
                                                    .onEnded({
                                                       
                                                        if pressed == item.location.street.number {
                                                            self.pressed = -1
                                                            // print("ID: \($0)", item.id)
                                                        }else{
                                                            self.pressed = item.location.street.number
                                                        }
                                                    })
                                        )
                                        .overlay(
                                            Group {
                                                
                                                    if pressed == item.location.street.number {
                                                       
                                                        // llama nuevamente el CardView
                                                            VStack {
                                                                CardView(pressed: $pressed, user: item)
                                                            }.background(Color.white)
                                                            
                                                    }}
                                                )
                                //}
                               
                            }
                        }).onAppear{
                            // llama el API y recibe la data
                            Api().getData { (users) in
                                self.userData = users
                            }
                            
                        }
                        
                        
                    //} .navigationTitle("My Friends")
                    
                }
            }
            
        }
       
        
        
    }
    
    
    
} // end View




struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
            MainView()
                .previewDevice("iPad Pro (12.9-inch) (4th generation)")
        }
    }
}



