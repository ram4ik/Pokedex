//
//  ContentView.swift
//  Pokedex
//
//  Created by ramil on 22.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var data: [PokemonEntry] = []
    
    var body: some View {
        NavigationView {
            List(data) { data in
                NavigationLink(destination: PokemonView(pokemon: data)) {
                    HStack {
                        Text(data.name)
                    }
                }
            }.navigationTitle("Pokemons")
        }
        .onAppear {
            PokeApi().getData(completion: { data in
                self.data = data
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
