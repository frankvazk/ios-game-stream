//
//  GamesViewModel.swift
//  GameStream
//
//  Created by Francisco Vazquez on 03/02/22.
//

import Foundation

class GamesViewModel:ObservableObject {
    @Published var gamesInfo = [Game]()
    
    init(){
        //Se crea el objeto URL
        if let url = URL(string:"https://gamestream-api.herokuapp.com/api/games") {
            //Se inicia la instancia del Request
            var request = URLRequest(url:url)
            //Se define el metodo HTTP para la petición
            request.httpMethod = "GET"
            //Se inicia la sesión para la petición
            URLSession.shared.dataTask(with: request) { data, response, error in
                do {
                    //Se valida la existencia de datos
                    if let jsonData = data {
                        print("Tamaño del Json: \(jsonData)")
                        //Se decodifica el información tomando como estructura de datos
                        //la estructura Game definida en el ViewModel
                        let decodedData = try
                            JSONDecoder().decode([Game].self, from: jsonData)
                        
                        //Se almacena de manera asíncrona la información dentro de la varible gamesInfo
                        //Esto permitirá que la aplicación no se bloquee al procesar los datos
                        DispatchQueue.main.async {
                            print( decodedData )
                            self.gamesInfo.append(contentsOf: decodedData)
                        }
                    }
                    else
                    {
                        print("No existen datos en el json recuperado")
                    }
                } catch{
                    print("Error: \(error)")
                }
            }
            .resume() //Esta línea ejecuta la petición
                
        }
    }
}
