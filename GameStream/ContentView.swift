//
//  ContentView.swift
//  GameStream
//
//  Created by Francisco Vazquez on 17/01/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                .ignoresSafeArea()
            
            VStack {
                Image("applogo")
                    .resizable()
                    .aspectRatio( contentMode: .fit )
                    .padding(.bottom, 20)
                    .frame(width: 250)
                InicioYRegistroView()
            }
            
        }
    }
}

struct InicioYRegistroView: View {
    @State var logInView : Bool = true
    var body: some View{
        VStack{
            HStack{
                Spacer()
                ActionButton(text: "INICIA SESIÓN", action: {
                    self.logInView = true
                }, isActive: logInView)
                Spacer()
                ActionButton(text: "REGISTRATE", action: {
                    self.logInView = false
                }, isActive: !logInView)
                
                Spacer()
            }
            
            Spacer(minLength: 42)
            
            if self.logInView {
                //Mostrara pantalla de inicio de sesion
                LogIntView()
            }
            else{
                //Mostrara pantalla de Registro
                SignInView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        Image("pantalla01")
            .resizable()
            .aspectRatio(
                contentMode: .fill
            )
        
    }
}

struct ActionButton : View{
    var text : String
    var action : () -> Void
    var isActive : Bool
    
    var body: some View{
        Button(self.text, action: self.action)
            .foregroundColor(self.isActive ? Color.white : Color.gray)
        
    }
    
    init(text:String, action: @escaping ()->Void, isActive: Bool){
        self.text = text
        self.action = action
        self.isActive = isActive
    }
}

struct LogIntView:View{
    @State var correo : String = ""
    @State var contrasena : String = ""
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading){
                Text("Correo electrónico")
                    .foregroundColor(Color("DarkCian"))
                    .bold()
                
                ZStack(alignment: .leading){
                    if correo.isEmpty {
                        Text("ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    TextField("", text: $correo)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("DarkCian"))
                    .padding(.bottom)
                
                Text("Constraseña")
                    .foregroundColor(.white)
                    .bold()
                
                ZStack(alignment: .leading){
                    if contrasena.isEmpty {
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $contrasena)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("DarkCian"))
                    .padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: UIScreen.main.bounds.width-40,
                           alignment: .trailing)
                    .foregroundColor(Color("DarkCian"))
                
            }.frame(width: UIScreen.main.bounds.width-40, alignment: .leading)
            
        }
    }
}

struct SignInView:View{
    var body: some View{
        Text("Esta es la vista de registro")
            .foregroundColor(Color.white)
    }
}

extension View {
    func placeholder<Content: View>(when shouldShow:Bool, aligment:Alignment = .leading,
                                    placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: .leading, content: {
            placeholder().opacity(shouldShow ? 1 : 0)
        })
    }
}
