//
//  ContentView.swift
//  ListJson
//
//  Created by 이종현 on 2022/11/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            
            VStack {
                Image("json_")
                    .padding()
                
                NavigationLink(destination: DY()) {
                    HStack {
                        Text("🐰")
                            .font(.title)
                        Text("다영")
                            .font(.title)
                            .bold()
                        Spacer()
                        Image(systemName: "map")
                        Text("경기도 공공 체육 시설")
                            .bold()
                            
                    }
                    .padding(12)
                    .frame(width: 360)
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .foregroundColor(.black)
                }
                .padding()
                
                NavigationLink(destination: JH()) {
                    HStack {
                        Text("🐯")
                            .font(.title)
                        Text("종현")
                            .font(.title)
                            .bold()
                        Spacer()
                        Image(systemName: "play.circle")
                        Text("Breaking Bad")
                            .bold()
                    }
                    .padding(12)
                    .frame(width: 360)
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .foregroundColor(.black)
                }
                .padding()
                
                NavigationLink(destination: JS()) {
                    HStack {
                        Text("🐳")
                            .font(.title)
                        Text("정선")
                            .font(.title)
                            .bold()
                        Spacer()
                        Text("주소록")
                            .bold()
                    }
                    .padding(12)
                    .frame(width: 360)
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .foregroundColor(.black)
                }
                .padding()
                
                NavigationLink(destination: SH()) {
                    HStack {
                        Text("🐶")
                            .font(.title)
                        Text("수현")
                            .font(.title)
                            .bold()
                        Spacer()
                        Text("경기 광주시 종교 시설")
                            .bold()
                    }
                    .padding(12)
                    .frame(width: 360)
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .foregroundColor(.black)
                }
                .padding()
               
                NavigationLink(destination: FineDust()) {
                    HStack {
                        Text("💨")
                            .font(.title)
                        Text("먼지")
                            .font(.title)
                            .bold()
                        Spacer()
                        Image(systemName: "chart.bar")
                        Text("경기 김해시 미세먼지 농도")
                            .bold()
                    }
                    .padding(12)
                    .frame(width: 360)
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .foregroundColor(.black)
                }
                .padding()
                
            }
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
