//
//  PokemonView.swift
//  Pokedex
//
//  Created by ramil on 22.11.2021.
//

import SwiftUI

struct PokemonView: View {
    let pokemon: PokemonEntry
    
    @State private var image = ""
    
    var body: some View {
        VStack {
            Text(pokemon.name)
            AsyncImage(url: URL(string: image))
                .frame(width: 20, height: 20, alignment: .center)
                .padding()
        }
        .onAppear {
            PokeSelectedApi().getData(url: pokemon.url) { sprites in
                self.image = sprites.back_default
            }
        }
    }
}
