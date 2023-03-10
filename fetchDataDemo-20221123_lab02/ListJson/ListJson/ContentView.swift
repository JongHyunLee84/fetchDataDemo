//
//  ContentView.swift
//  ListJson
//
//  Created by μ΄μ’ν on 2022/11/23.
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
                        Text("π°")
                            .font(.title)
                        Text("λ€μ")
                            .font(.title)
                            .bold()
                        Spacer()
                        Image(systemName: "map")
                        Text("κ²½κΈ°λ κ³΅κ³΅ μ²΄μ‘ μμ€")
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
                        Text("π―")
                            .font(.title)
                        Text("μ’ν")
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
                        Text("π³")
                            .font(.title)
                        Text("μ μ ")
                            .font(.title)
                            .bold()
                        Spacer()
                        Text("μ£Όμλ‘")
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
                        Text("πΆ")
                            .font(.title)
                        Text("μν")
                            .font(.title)
                            .bold()
                        Spacer()
                        Text("κ²½κΈ° κ΄μ£Όμ μ’κ΅ μμ€")
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
                        Text("π¨")
                            .font(.title)
                        Text("λ¨Όμ§")
                            .font(.title)
                            .bold()
                        Spacer()
                        Image(systemName: "chart.bar")
                        Text("κ²½κΈ° κΉν΄μ λ―ΈμΈλ¨Όμ§ λλ")
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
