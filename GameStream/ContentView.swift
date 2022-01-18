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
                    .aspectRatio( contentMode: .fit
                    )
                .frame(width: 250)
                InicioYRegistroView()
            }
            
        }
    }
}

struct InicioYRegistroView: View {
    var body: some View{
        VStack{
            HStack{
                Text("INICIA SESIÓN")
                Text("REGÍSTRATE")
                    .foregroundColor(Color.white)
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
