//
//  CardView.swift
//  usergrid
//
//  Created by Andres Becerra on 19/08/21.
//

import SwiftUI


struct CardView: View {
    
    @Binding var pressed: Int
    
    var user: User
    
    
    
    var body: some View {
        
        HStack{
            
            RemoteImage(placeholderImage: Image(systemName: "photo"), imageDownloader: DefaultImageDownloader(imagePath: user.picture.large))
                //.padding(10)
                .frame(width: 150, height: 150)
                .background(Color.gray)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading) {
                
                
                if pressed == -1 {
                    Text(user.name.first + " " + user.name.last)
                        .font(.title)
                        .foregroundColor(Color(hue: 0.511, saturation: 0.955, brightness: 0.624))
                      
                    Text(user.location.country)
                        .font(.subheadline)
                }else{
                    
                    VStack {
                        
                        VStack{
                            Text(user.name.first + " " + user.name.last)
                                .font(.subheadline)
                                .foregroundColor(Color(hue: 0.511, saturation: 0.955, brightness: 0.624))
                            Divider()
                            Text(user.email)
                                .font(.subheadline)
                               
                            Text(user.cell)
                                .font(.subheadline)
                                
                            Text(user.location.country)
                                .font(.subheadline)
                                
                            Text(user.location.state + ", " + user.location.city)
                                .font(.subheadline)
                                
                            Text(user.location.street.number.description + " " + user.location.street.name  )
                                .font(.subheadline)
                                
                        }
                        .padding()
                    }
                    .border(Color.gray)
                    
                }
        
            }
            Spacer()
            
        }.padding()
  
       
    } // end body
} // end view

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        
        CardView(pressed: .constant(-1), user: User(name: Name.init(title: "Mr", first: "Andres", last: "Becerra"), email: "andres@gmail.com", cell: "320 333445", location: Location.init(street: Street.init(number: 123, name: "Calle Luna"), city: "Barranquilla", state: "Atlantico", country: "Colombia"), picture: Picture(large: "image1")))
        
        
       /*
         CardView(pressed: .constant(10), user: UserModel(id: 1, fullname: "Andres Becerra", country: "Colombia", addres: "Calle Luna", city: "Barranquilla", state: "Atlanticp", email: "andres@gmail.com", cell: "320 334454", urlImage: "image4"))
             .previewLayout(.fixed(width: 400, height: 200))
         */
    }
}


/*
Image(user.picture.large)
    .resizable()
    .padding(10)
    .frame(width: 150, height: 150)
    .background(Color.gray)
    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    .shadow(color: Color.gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
 */
