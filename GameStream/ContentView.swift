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
        Image("pantalla02")
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
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                Text("Correo electrónico")
                    .foregroundColor(Color("DarkCian"))
                    .bold()
                
                ZStack(alignment: .leading){
                    if correo.isEmpty {
                        Text(verbatim:"ejemplo@gmail.com")
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
                    .padding(.bottom, 50)
                
                Button(action:self.iniciarSesion, label: {
                    Text(
                        "INICIAR SESION"
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
                
                Text("Inicia sesion con redes sociales")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color("LightGray"))
                    .padding(.top, 80)
                    .padding(.bottom, 10)
                
                HStack(alignment: .center){
                    Spacer()
                    Button( action: {
                        print("Facebook")
                    }, label: {
                        Text("Facebook")
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(width: 120, alignment: .center)
                            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                            .background(
                               Color("BlueGray")
                            )
                    }).cornerRadius(8.0)
                    Button( action: {
                        print("Twitter")
                    }, label: {
                        Text("Twitter")
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(width: 120, alignment: .center)
                            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                            .background(
                               Color("BlueGray")
                            )
                    }).cornerRadius(8.0)
                    Spacer()
                }.frame(maxWidth: .infinity, alignment: .center)
                
            }.padding(.horizontal).frame(width: UIScreen.main.bounds.width, alignment: .leading)
        }
    }
    
    func iniciarSesion(){
        print("Iniciar Sesión")
    }
}

struct SignInView:View{
    @State var correo : String = ""
    @State var contrasena : String = ""
    @State var confirmar_contrasena : String = ""
    
    
    var body: some View{
        ScrollView(showsIndicators: false){
            Text("Elije una foto de perfil")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(Color("LightGray"))
                .padding(.bottom, 5)
            Text("Puedes cambiar p elegirla mñas adelante")
                .font(.footnote)
                .fontWeight(.light)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(Color("LightGray"))
                .padding(.bottom, 10)
            Button(action: self.signIn, label: {
                ZStack {
                    Image("profile")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 80, height: 80, alignment: .center)
                    
                    Image(systemName: "camera")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 35, alignment: .center)
                    
                }
            })
                .padding(.bottom, 30)
            
            
            VStack(alignment: .leading){
                
                VStack(alignment: .leading) {
                    Text("Correo electrónico")
                        .foregroundColor(Color("DarkCian"))
                    .bold()
                    ZStack(alignment: .leading){
                        if correo.isEmpty {
                            Text(verbatim:"ejemplo@gmail.com")
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
                }
                                            
                VStack(alignment: .leading) {
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
                }
                
                                        
                VStack(alignment: .leading) {
                    Text("Confirmar Constraseña")
                        .foregroundColor(.white)
                    .bold()
                    
                    ZStack(alignment: .leading){
                        if confirmar_contrasena.isEmpty {
                            Text("Vuelve a escribir contraseña")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $confirmar_contrasena)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("DarkCian"))
                        .padding(.bottom)
                }
                
                Button(action:self.iniciarSesion, label: {
                    Text(
                        "REGÍSTRATE"
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
                
                Text("Regístrate con redes sociales")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color("LightGray"))
                    .padding(.top, 50)
                    .padding(.bottom, 10)
                
                HStack(alignment: .center){
                    Spacer()
                    Button( action: {
                        print("Facebook")
                    }, label: {
                        Text("Facebook")
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(width: 120, alignment: .center)
                            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                            .background(
                               Color("BlueGray")
                            )
                    }).cornerRadius(8.0)
                    Button( action: {
                        print("Twitter")
                    }, label: {
                        Text("Twitter")
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(width: 120, alignment: .center)
                            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                            .background(
                               Color("BlueGray")
                            )
                    }).cornerRadius(8.0)
                    Spacer()
                }.frame(maxWidth: .infinity, alignment: .center)
                
            }.padding(.horizontal).frame(width: UIScreen.main.bounds.width, alignment: .leading)
        }
    }
    
    func iniciarSesion(){
        print("Iniciar Sesión")
    }
    
    func signIn(){
        print("SignIn Button Action")
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
