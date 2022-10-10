//
//  ContentView.swift
//  war challenge
//
//  Created by Ankur Kalson on 2022-10-09.
//

import SwiftUI

struct ContentView: View {
    
   @State var playerCard = "card5"
   @State var cpuCard = "card9"
   @State var playerScore: Int = 0
   @State var cpuScore: Int = 0
   @State var showAlert = false
   @State var winner = ""
    
    
    
    var body: some View {
        ZStack{
            Image("background")
                .ignoresSafeArea()
            
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                    
                }
                Spacer()
                Button(action: {
                    //generat random num b/w 2 and 14
                    let playerRandom = Int.random(in: 2...14)
                    let cpuRandom = Int.random(in: 2...14)
                    
                        playerCard = "card"+String(playerRandom)
                        cpuCard = "card"+String(cpuRandom)
                    
                    if(playerRandom > cpuRandom){
                        playerScore += 1
                    }else{
                        cpuScore += 1
                    }
                    
                    if (playerScore == 10 || cpuScore == 10) {
                        showAlert = true
                        
                        if(playerScore == 10){
                            winner = "PLayer"
                        }else{
                            winner = "CPU"
                        }
                    }
                    
                }, label: {
                    Image("dealbutton")
                })
                .alert(isPresented: $showAlert) { // 4
                    Alert(
                        title: Text("Gamer over"),
                        message: Text("\(winner) won!!"),
                        dismissButton: .default(Text("Play again"),
                                                action: {
                                                    playerScore = 0
                                                    cpuScore = 0
                                                })
                    )
                }
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
