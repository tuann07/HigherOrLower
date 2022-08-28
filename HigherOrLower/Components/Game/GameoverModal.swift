/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Anh Tuan
  ID: 3817907
  Created  date: 28/08/2022
  Last modified: 28/08/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct GameoverModal: View {
    var highscore: Int
    var playingHighscore: Int
    var isGameover: Bool
    var isNewHighscore: () -> Bool
    var newGame: () -> Void
    
    var body: some View {
        // MARK: MODAL
        ZStack{
            Color(.black)
                .opacity(0.66)
                .edgesIgnoringSafeArea(.all)
            
            // MARK: MODAL CONTENT
            VStack{
                // MARK: TITLE
                Text(isNewHighscore() ? "Congratulation" : "GAME OVER")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Blue700"))
                
                Spacer()
                
                // MARK: BODY
                VStack {
                    Text(isNewHighscore() ? "You set a new highscore.\nKeep up the good work." : "You almost got there.\nGive it another try.")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(Color("Blue700"))
                        .padding(.bottom)
                        .multilineTextAlignment(.center)
                    
                    Text("Highscore")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Blue700"))
                        .padding(.bottom, 5)
                    
                    Text("This game: " + String(playingHighscore))
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(Color("Blue700"))
                    
                    Text("All time: " + String(highscore))
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(Color("Blue700"))
                    
                }
                
                Spacer()
                
                // MARK: BUTTON
                Button {
                    self.newGame()
                } label: {
                    Text("New Game")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Blue400"))
                        .padding(.vertical, 15)
                        .padding(.horizontal, 70)
                        .background(Color("Yellow"))
                        .modifier(CornerMod())
                }
            }
            .padding(20)
            .opacity(isGameover ? 1 : 0)
            .frame(width:320, height: 380, alignment: .center)
            .background(Color("Blue300"))
            .modifier(CornerMod())
        } //ZStack
        .onAppear(perform: {
            if isNewHighscore() {
                playSound(sound: "new-highscore", type: "wav")
            } else {
                playSound(sound: "sad-gameover", type: "wav")
            }
        })
    }
}

struct GameoverModal_Previews: PreviewProvider {
    static var previews: some View {
        GameoverModal(highscore: 100, playingHighscore: 100, isGameover: true, isNewHighscore: {return true}, newGame: {})
    }
}
