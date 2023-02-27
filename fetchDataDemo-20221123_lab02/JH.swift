//
//  BreakingBad.swift
//  ListJson
//
//  Created by 이종현 on 2022/11/23.
//

import SwiftUI

struct JH: View {
    @ObservedObject var breakingBad: BreakingStore = BreakingStore(breakingBads: [])
    var webService: WebService = WebService()
    let url: String = "https://www.breakingbadapi.com/api/quotes"
    var body: some View {
        NavigationStack {
            List {
                ForEach(breakingBad.breakingBads, id: \.self) { i in
                    HStack {
                        switch i.author {
                        case "Walter White":
                            Image("WalterWhite")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 50)
                        case "Mike Ehrmantraut":
                            Image("Mike")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 50)
                        case "Skyler White":
                            Image("SkylerWhite")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 50)
                        case "Saul Goodman":
                            Image("SaulGoodman")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 50)
                        case "Jesse Pinkman":
                            Image("JessPinkman")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 50)
                        case "Hank Schrader":
                            Image("Hank")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 50)
                        default:
                            Image("BreakingBadMain")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 50)
                        }
                        
                        
                        VStack(alignment: .leading){
                            Text(i.author)
                                .font(.headline)
                            Text(i.quote)
                                .font(.subheadline)
                        }
                    }
                    
                   
                    
                    
                }
            }
            .onAppear() {
                Task {
                    breakingBad.breakingBads = try await webService.fetchData(url: url)
                }
            }
            .navigationTitle("Breaking Bad Quote")

        }
        
    }
}

struct JH_Previews: PreviewProvider {
    static var previews: some View {
        JH()
    }
}

struct BreakingBad: Codable, Hashable {
    let quote_id : Int
    let quote : String
    let author : String
    let series : String
}

class BreakingStore : ObservableObject {
    @Published var breakingBads: [BreakingBad]
    init (breakingBads: [BreakingBad] = []) {
        self.breakingBads = breakingBads
    }
}

class WebService {
    func fetchData(url: String) async throws -> [BreakingBad] {
        guard let url = URL(string: url) else { return [] }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let centers = try JSONDecoder().decode([BreakingBad].self, from: data)
        
        return centers
    }
}


