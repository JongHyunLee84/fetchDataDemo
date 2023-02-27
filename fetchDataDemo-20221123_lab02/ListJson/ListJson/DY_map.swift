//
//  DY.swift
//  ListJson
//
//  Created by 이종현 on 2022/11/23.
//

//
//  ContentView.swift
//  apiTest
//
//  Created by 장다영 on 2022/11/23.
//

import SwiftUI
import Foundation
import MapKit
struct DY_map: View {
    
    @ObservedObject var soccerField: Fields = Fields(fields: [])
    @EnvironmentObject var map: AnnotatedItems
    var webService: WebService2 = WebService2()
    
    let url: String = "https://mocki.io/v1/bdda7435-f350-4382-a70b-257353476f38"
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.2621799, longitude: 127.067556),
            span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        )
    var body: some View {
        NavigationStack {
            VStack {
                Map(coordinateRegion: $region,
                    annotationItems: map.mapArray) { item in
                    
                    MapMarker(coordinate: item.coordinate ?? CLLocationCoordinate2D(latitude: 37.2621799, longitude: 127.067556) , tint: .purple)
                }
            }
            .navigationTitle("Map")
            .onAppear{
                

                    Task {
                        soccerField.fields = try await webService.fetchData(url: url)
                        for i in soccerField.fields {
                            if i.REFINE_WGS84_LAT != "" && i.REFINE_WGS84_LOGT != "" {
                                map.mapArray.append(AnnotatedItems(name: i.FACLT_NM, address: i.REFINE_LOTNO_ADDR, latitude: i.REFINE_WGS84_LAT, longitude: i.REFINE_WGS84_LOGT))
                            }
                            
                        }

                }

            }
        }

        }
    }


//struct Facts: Codable, Hashable {
//    var fact: String
//}
//
struct Field: Codable, Hashable {
    var FACLT_NM: String //구장이름
    var REFINE_LOTNO_ADDR: String //주소
    
    var REFINE_WGS84_LAT: String //위도
    var REFINE_WGS84_LOGT: String //경도
}

class Fields: ObservableObject {
    @Published var fields: [Field]
    
    init (fields: [Field] = []) {
        self.fields = fields
    }
}
class AnnotatedItems: Identifiable, ObservableObject {
    @Published var mapArray: [AnnotatedItems] = []
    let id = UUID()
    @Published var name: String
    @Published var address : String
    @Published var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.2621799, longitude: 127.067556)
    init(name: String, address: String, latitude: String, longitude: String) {
        self.name = name
        self.address = address
        self.coordinate.latitude = Double(latitude) ?? 37.2621799
        self.coordinate.longitude = Double(longitude) ?? 127.067556
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
//class MapItems: ObservableObject {
//    var name : String
//    var address : String
//    var coordinate : CLLocationCoordinate2D?
//    @Published var mapList : [AnnotatedItems]
//
//}

//struct DY_Previews: PreviewProvider {
//    static var previews: some View {
//        DY()
//            .environmentObject(AnnotatedItems())
//    }
//}


