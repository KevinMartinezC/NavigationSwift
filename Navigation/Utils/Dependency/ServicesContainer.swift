//
//  ServicesContainer.swift
//  Navigation
//
//  Created by KevinMartinez on 10/3/25.
//

import Factory
import Foundation
import Networking
import Core

extension Container {

    var httpClient: Factory<HTTPClient> {
          self {
              MoyaClient(baseURL: "https://rickandmortyapi.com/api")
          }
          .singleton
      }

    var characterService: Factory<CharacterServiceType> {
        self {
            CharacterService(client: self.httpClient())
        }
        .unique
    }
}
