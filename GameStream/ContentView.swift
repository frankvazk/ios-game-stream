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
        Image("pantalla01")
            .resizable()
            .aspectRatio(
                contentMode: .fill
            )
        ContentView()
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
    var body: some View{
        Text("Esta es la vista de inicio de sesion")
            .foregroundColor(Color.white)
    }
}

struct SignInView:View{
    var body: some View{
        Text("Esta es la vista de registro")
            .foregroundColor(Color.white)
    }
}
