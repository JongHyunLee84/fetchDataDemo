//
//  fineDust.swift
//  ListJson
//
//  Created by 오수현 on 2022/11/24.
//

import SwiftUI
import Foundation

struct FineDust: View {
    @ObservedObject var fineDustInformation: FineDustInformation = FineDustInformation(dust: [])
    
    var webService: WebService5 = WebService5()
    
    let url: String = "https://smartcity.gimhae.go.kr/smart_tour/dashboard/api/publicData/dustSensor"
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section { //MapView로 넘어가기
                        NavigationLink(destination: fineDustChart(fineDustInformation: fineDustInformation)) {
                            HStack {
                                Image(systemName: "chart.bar")
                                Text("미세먼지 농도 차트 보기")
                            }
                            .foregroundColor(.accentColor)
                            
                        }
                        
                        NavigationLink(destination: microDustChart(fineDustInformation: fineDustInformation)) {
                            HStack {
                                Image(systemName: "chart.bar")
                                Text("초미세먼지 농도 차트 보기")
                            }
                            .foregroundColor(.accentColor)
                            
                        }
                    }
                    
                    
                    Section {
                        ForEach(fineDustInformation.dust, id:\.self) { dust in
                            VStack(alignment: .leading) {
                                Text("미세먼지 센서명: \(dust.name)")
                                    .font(.headline)
                                Text("미세먼지 농도: \(dust.pm10_after)")
                                    .font(.subheadline)
                                Text("초미세먼지 농도: \(dust.pm25_after)")
                                    .font(.subheadline)
                            }
                        }
                    }
                    
                }.onAppear() {
                    Task {
                     fineDustInformation.dust = try await webService.fetchData(url: url)
                    }
                }
            }
            .navigationTitle("경남 김해시 미세먼지농도")
        }
    }
}


struct APIdata: Codable, Hashable {
    let status : String
    let message: String
    let data : [FineDustData]
}

struct FineDustData: Codable, Hashable {
    let dev_id: String
    let name: String
    let loc: String
    let coordx: String
    let coordy: String
    let ison: Bool
    let pm10_after: Int
    let pm25_after: Int
    let state: Int
    let timestamp: String
    let company_id: String
    let company_name: String
}

class FineDustInformation: ObservableObject {
    
    @Published var dust: [FineDustData]
    
    init (dust: [FineDustData] = []) {
        self.dust = dust
    }
    
}

class WebService5 {
    func fetchData(url: String) async throws -> [FineDustData] {
        guard let url = URL(string: url) else { return [] }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let dust = try JSONDecoder().decode(APIdata.self, from: data)
        
        return dust.data
    }
}

struct fineDust_Previews: PreviewProvider {
    static var previews: some View {
        FineDust()
    }
}
