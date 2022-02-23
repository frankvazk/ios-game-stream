//
//  SearchGameViewModel.swift
//  GameStream
//
//  Created by Francisco Vazquez on 22/02/22.
//

import Foundation

class SearchGameViewModel : ObservableObject {
    @Published var gamesFounded = [Game]()
    
    func search(gameName : String ) {
        
        self.gamesFounded.removeAll()
        
        if let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            if let url = URL(string:"https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces)") {
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
                                self.gamesFounded.append(contentsOf: decodedData)
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
}
