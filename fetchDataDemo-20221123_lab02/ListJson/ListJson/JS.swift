//
//  JS.swift
//  ListJson
//
//  Created by 이종현 on 2022/11/23.
//

import SwiftUI
import Foundation

struct JS: View {
    @ObservedObject var addressBook: AddressBookStore = AddressBookStore(addressBooks: [])
    var webService: WebService3 = WebService3()
    let url: String = "https://fakerapi.it/api/v1/companies?_seed=12456"
    
    var body: some View {
            List {
                ForEach(addressBook.addressBooks, id: \.self) { i in
                    VStack(alignment: .leading) {
                        Text(i.name)
                            .font(.title3)
                        Text(i.country)
                    }
                    
                    .navigationTitle("Address Book")
                }
                .listStyle(GroupedListStyle())
                
            }
            
            .onAppear() {
                Task {
                    addressBook.addressBooks = try await webService.fetchData(url: url)
                }
            }
        }
}
    
    struct AddressBook: Codable, Hashable {
        var status: String
        var code: Int
        var total: Int
        var data: [Info]
    }
    
    struct Info: Codable, Hashable {
        var id: Int
        var name: String
        var country: String
        var addresses: [Address]
        var website: String
        var image: String
    }
    
    struct Address: Codable, Hashable {
        var id: Int
        var street: String
        var city: String
    }
    
    class AddressBookStore : ObservableObject {
        @Published var addressBooks: [Info]
        init (addressBooks: [Info] = []) {
            self.addressBooks = addressBooks
        }
    }
class WebService3 {
    func fetchData(url: String) async throws -> [Info] {
        guard let url = URL(string: url) else { return [] }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let centers = try JSONDecoder().decode(AddressBook.self, from: data)
        
        return centers.data
    }
}


struct JS_Previews: PreviewProvider {
    static var previews: some View {
        JS()
    }
}




