//
//  ContentView.swift
//  Pokedex
//
//  Created by ramil on 22.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var data: [PokemonEntry] = []
    @State private var search = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(search == "" ? data : data.filter({
                    $0.name.contains(search.lowercased())
                })) { entry in
                    NavigationLink(destination: PokemonView(pokemon: entry)) {
                        Text(entry.name)
                    }
                }
            }
            .navigationTitle("Pokemons")
        }
        .searchable(text: $search)
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
