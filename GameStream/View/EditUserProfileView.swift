//
//  EditUserProfileView.swift
//  GameStream
//
//  Created by Francisco Vazquez on 23/02/22.
//

import SwiftUI

struct EditUserProfileView: View {
    var body: some View {
        ZStack{
            Color("Marine")
                .ignoresSafeArea()
            
            VStack{
                Button {
                    
                } label: {
                    ZStack{
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 118, height: 118)
                            .clipShape(Circle())
                        
                        Image(systemName: "camera")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 35, alignment: .center)
                            
                    }
                }
                .padding(.bottom, 20)
                
                ProfileForm()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ProfileForm : View {
    @State var username : String = ""
    @State var password : String = ""
    @State var email    : String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Correo electrónico")
                    .foregroundColor(Color("DarkCian"))
                .bold()
                ZStack(alignment: .leading){
                    if self.email.isEmpty {
                        Text(verbatim:"ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    TextField("", text: self.$email)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("DarkCian"))
                    .padding(.bottom)
            }
            
            VStack(alignment: .leading) {
                Text("Constraseña")
                    .foregroundColor(self.password.isEmpty ? .white : Color("DarkCian") )
                .bold()
                ZStack(alignment: .leading){
                    if self.password.isEmpty {
                        Text("Introduce tu nueva contraseña")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    SecureField("", text: self.$password)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background( self.password.isEmpty ? .white : Color("DarkCian"))
                    .padding(.bottom)
            }
            
            VStack(alignment: .leading) {
                Text("Nombre")
                    .foregroundColor( self.username.isEmpty ? .white : Color("DarkCian") )
                .bold()
                ZStack(alignment: .leading){
                    if self.username.isEmpty {
                        Text("Introduce tu nombre de usuario")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    TextField("", text: self.$username)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background( self.username.isEmpty ? .white : Color("DarkCian") )
                    .padding(.bottom)
            }
            .padding(.bottom, 20)
            
            Button(action:self.updateUserProfile, label: {
                Text(
                    "ACTUALIZAR DATOS"
                )
                    .foregroundColor(.white)
                    .bold()
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .frame(
                        maxWidth: .infinity, alignment: .center)
                    .overlay( RoundedRectangle(cornerRadius: 6.0)
                                .stroke(Color("DarkCian"), lineWidth: 3.0)
                                .shadow(color: .white, radius: 4))
                
            })
                .padding(.horizontal,10)
        }
        .padding(.horizontal, 20.0)
    }
    
    func updateUserProfile(){
        
    }
}

struct EditUserProfileView_Previews: PreviewProvider {

    
    static var previews: some View {
        EditUserProfileView()
    }
    

}
