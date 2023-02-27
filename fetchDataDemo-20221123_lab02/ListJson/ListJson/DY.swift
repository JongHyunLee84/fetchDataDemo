//
//  ContentView.swift
//  apiTest
//
//  Created by 장다영 on 2022/11/23.
//

import SwiftUI
import Foundation

struct DY: View {
    
    @ObservedObject var soccerField: Fields = Fields(fields: [])
    
    var webService: WebService2 = WebService2()
    
    let url: String = "https://mocki.io/v1/bdda7435-f350-4382-a70b-257353476f38"
    
    var body: some View {

                List {
                    Section { //MapView로 넘어가기
                        NavigationLink(destination: DY_map()) {
                            HStack {
                                Image(systemName: "map")
                                Text("지도에서 보기")
                            }
                            .foregroundColor(.accentColor)
                            
                        }}
                        
                    Section { //JSon데이터 출력 리스트
                        ForEach(soccerField.fields, id:\.self) { data in
                            VStack(alignment: .leading) {
                                Text("\(data.FACLT_NM)")
                                    .font(.title3)
                                    .bold()
                                
                                if data.REFINE_LOTNO_ADDR != "" {
                                    Text("주소 :\(data.REFINE_LOTNO_ADDR)")
                                }
                                
                                if data.REFINE_WGS84_LAT != "" {
                                    Text("위도 :\(data.REFINE_WGS84_LAT)")
                                }
                                
                                if data.REFINE_WGS84_LOGT != "" {
                                    Text("경도 :\(data.REFINE_WGS84_LOGT)")
                                }
                            }
                        }
                    }
                    
                    
                }
                .onAppear{
                    
                    Task {

                            soccerField.fields = try await webService.fetchData(url: url)
                    }
                }
                .navigationTitle("경기도 공공 체육 시설")
                }
                
        
    
    
    struct Facts: Codable, Hashable {
        var fact: String
    }
    
    struct Field: Codable, Hashable {
        var FACLT_NM: String
        var REFINE_LOTNO_ADDR: String
        
        var REFINE_WGS84_LAT: String
        var REFINE_WGS84_LOGT: String
    }
    
    class Fields: ObservableObject {
        @Published var fields: [Field]
        
        init (fields: [Field] = []) {
            self.fields = fields
        }
    }
    
    class WebService2 {
        func fetchData(url: String) async throws -> [Field] {
            guard let url = URL(string: url) else { return [] }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let fields = try JSONDecoder().decode([Field].self, from: data)
            
            return fields
        }
    }
}

struct DY_Previews: PreviewProvider {
    static var previews: some View {
        DY()
    }
}
