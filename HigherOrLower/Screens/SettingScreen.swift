/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Anh Tuan
  ID: 3817907
  Created  date: 26/08/2022
  Last modified: 28/08/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct SettingScreen: View {
    @AppStorage(AppStorageKeys.username.rawValue) private var username = usernameDefault
    @AppStorage(AppStorageKeys.difficulty.rawValue) private var difficulty = Difficulty.easy
    
    var body: some View {
        ZStack {
            Color("Blue400")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                VStack {
                    Text("Change your username")
                        .bold()
                        .foregroundColor(Color("Blue700"))
                    
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color("Blue300"))
                        .modifier(CornerMod())
                }
                .padding(.bottom)
                
                VStack {
                    Text("Change difficulty")
                        .bold()
                        .foregroundColor(Color("Blue700"))
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            difficulty = Difficulty.easy
                        } label: {
                            SettingButton(text: "Easy", difficulty: Difficulty.easy)
                        }
                        
                        Spacer()
                        
                        Button {
                            difficulty = Difficulty.hard
                        } label: {
                            SettingButton(text: "Hard", difficulty: Difficulty.hard)
                        }
                        
                        Spacer()
                    }
                }
            }
            .modifier(ScreenMod())
        }
        .navigationTitle("Settings")
        
        
    }
}

struct SettingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreen()
    }
}
