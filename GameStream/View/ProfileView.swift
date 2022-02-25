//
//  ProfileView.swift
//  GameStream
//
//  Created by Francisco Vazquez on 23/02/22.
//

import SwiftUI

struct ProfileView: View {
    @State var username : String = "Francisco"
    @State var profilePicture : UIImage = UIImage(named: "profile")!
    
    var body: some View {
        ZStack{
            Color("Marine")
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                
            VStack{
                
                Text("Perfil")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 30, trailing: 0))
                
                VStack{
                    Image(uiImage: self.profilePicture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118.0, height: 118.0, alignment: .center)
                        .clipShape(Circle())
                                        
                }
                
                Text("AJUSTES")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                SettingsModule()
            }
            
        }
        .onAppear(perform: {
            if self.loadProfileImage(named: "profilePicture") != nil {
                self.profilePicture = self.loadProfileImage(named: "profilePicture")!
            }
            else{
                print("No se encontro la imagen")
            }
        })
    }
    
    func loadProfileImage( named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        
        return nil
            
    }
}

struct SettingsModule : View {
    @State var isToggleOn : Bool = true
    @State var isEditProfileViewActive : Bool = false
    
    var body: some View {
        VStack(spacing: 3.0){
            Button {
                
            } label: {
                HStack{
                    Text("Cuenta")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                }
                .padding()
            }
            .background(Color("BlueGray"))
            
            HStack{
                Text("Notificaciones")
                    .foregroundColor(.white)
                Spacer()
                Toggle("", isOn: self.$isToggleOn)
            }
            .padding()
            .background(Color("BlueGray"))
            
            Button {
                self.isEditProfileViewActive = true
            } label: {
                HStack{
                    Text("Editar Perfil")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                }
                .padding()
            }
            .background(Color("BlueGray"))
            
            Button {
            } label: {
                HStack{
                    Text("Califica esta aplicación")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                }
                .padding()
            }
            .background(Color("BlueGray"))
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        NavigationLink(isActive: self.$isEditProfileViewActive) {
            EditUserProfileView()
        } label: {
            EmptyView()
        }

    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
