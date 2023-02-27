//
//  SH.swift
//  ListJson
//
//  Created by 이종현 on 2022/11/23.
//

import SwiftUI

import SwiftUI
import Foundation

struct SH: View {
    @ObservedObject var religionstore: ReligionDatastore = ReligionDatastore(churchs: [])
    
    var webService: WebService1 = WebService1()
    
    let url: String = "https://api.odcloud.kr/api/15042232/v1/uddi:0b4d16be-2f1b-4dc5-afcf-94a3a39b7103?page=1&perPage=100&serviceKey=data-portal-test-key"
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(religionstore.churchs, id:\.self) { church in
                        VStack(alignment: .leading) {
                            Text("\(church.종교시설명)")
                                .font(.headline)
                            Text("\(church.지번주소)")
                                .font(.subheadline)
                        }
                    }
                }.onAppear() {
                    Task {
                     religionstore.churchs = try await webService.fetchData(url: url)
                    }
                }
            }
            .navigationTitle("경기 광주시 종교시설")
        }
    }
}


struct Arraydata: Codable, Hashable {
    let currentCount : Int
    let data : [UseData]
}

struct UseData: Codable, Hashable {
    let 경도: String
    let 데이터기준일자: String
    let 위도: String
    let 종교구분코드: String
    let 종교시설명: String
    let 지번주소: String
}

class ReligionDatastore: ObservableObject {
    
    @Published var churchs: [UseData]
    
    init (churchs: [UseData] = []) {
        self.churchs = churchs
    }
    
}

class WebService1 {
    func fetchData(url: String) async throws -> [UseData] {
        guard let url = URL(string: url) else { return [] }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let churchs = try JSONDecoder().decode(Arraydata.self, from: data)
        
        return churchs.data
    }
}


struct SH_Previews: PreviewProvider {
    static var previews: some View {
        SH()
    }
}
