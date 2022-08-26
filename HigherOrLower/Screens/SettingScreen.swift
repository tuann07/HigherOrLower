/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Anh Tuan
  ID: 3817907
  Created  date: 26/08/2022
  Last modified: 26/08/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct SettingScreen: View {
    @AppStorage("username") private var username = "player1"
    @AppStorage("difficulty") private var difficulty = Difficulty.easy
    
    var body: some View {
        ZStack {
            Color("Blue400")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                VStack {
                    Text("Change your username")
                        .bold()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 320, alignment: .center)
                        .background(Color("Blue300"))
                        .cornerRadius(10)
                        .modifier(ShadowMod())
                }
                .padding(.bottom)
                
                VStack {
                    Text("Change difficulty")
                        .bold()
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            difficulty = Difficulty.easy
                        } label: {
                            Text("Easy")
                                .bold()
                                .foregroundColor(Color("Blue700"))
                                .padding()
                                .background(difficulty == Difficulty.easy ? Color("Yellow") : Color("Blue300"))
                                .cornerRadius(10)
                                .modifier(ShadowMod())
                        }
                        
                        Spacer()
                        
                        Button {
                            difficulty = Difficulty.hard
                        } label: {
                            Text("Hard")
                                .bold()
                                .foregroundColor(Color("Blue700"))
                                .padding()
                                .background(difficulty == Difficulty.hard ? Color("Yellow") : Color("Blue300"))
                                .cornerRadius(10)
                                .modifier(ShadowMod())
                        }
                        
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Settings")
        
        
    }
}

struct SettingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreen()
    }
}
