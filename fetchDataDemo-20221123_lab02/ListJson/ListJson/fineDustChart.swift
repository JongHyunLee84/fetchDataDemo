//
//  fineDustChart.swift
//  ListJson
//
//  Created by 장다영 on 2022/11/24.
//

import SwiftUI
import Charts

struct fineDustChart: View {
    var fineDustInformation: FineDustInformation = FineDustInformation(dust: [])
    
    var body: some View {
        ScrollView {
            VStack{
                Chart {
                    ForEach(fineDustInformation.dust, id:\.self) { info in
                        BarMark(x: .value("pm10_after", info.pm10_after),y: .value("name", info.name))

                    }
                    
                }
                .frame(height: 1800)
                
                
            }
        }
        .navigationTitle("미세먼지 농도")
            
        
        
            

            

//            VStack {
//                Chart {
//                    ForEach(fineDustInformation.dust, id:\.self) { info in
//                        BarMark(x: .value("pm10_after", info.pm10_after),y: .value("name", info.name), width: 20)
//
//                    }
//
//                }
//            }
        
        
    }
}

struct fineDustChart_Previews: PreviewProvider {
    static var previews: some View {
        fineDustChart()
    }
}
