//
//  microDust.swift
//  ListJson
//
//  Created by 장다영 on 2022/11/24.
//

import SwiftUI
import Charts

struct microDustChart: View {
    var fineDustInformation: FineDustInformation = FineDustInformation(dust: [])
    
    var body: some View {
        ScrollView {
            VStack {
                Chart {
                    ForEach(fineDustInformation.dust, id:\.self) { info in
                        BarMark(x: .value("pm25_after", info.pm25_after), y: .value("name", info.name))
                    
                    }
                    
                
                }.frame(height: 1800)
                
            }
        }
        .navigationTitle("초미세먼지 농도")
        
            
        
    }
}

struct microDustChart_Previews: PreviewProvider {
    static var previews: some View {
        microDustChart()
    }
}
