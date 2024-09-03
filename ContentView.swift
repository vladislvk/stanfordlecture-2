import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["😈","👿","🤖","👾","😈","👿","🤖","👾"]
    @State var cardCount = 4
    
    var body: some View {
        VStack(content: {
            HStack {
                ForEach(0..<cardCount, id: \.self){ index in
                    CardView(isFaceUp: true, content: emojis[index])
                }
            }
            HStack(content: {
                removeCard(cardCount:cardCount)
                Spacer()
                addCard(cardCount:cardCount,emojis:emojis)
            })
        })
        .padding()
    }
    struct removeCard: View {
        @State var cardCount:Int
        var body: some View {
            Button(action: {
                if cardCount > 1{
                    cardCount -= 1
                }
            }, label: {
                Text("Remove card")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            })
        }
    }
    struct addCard: View {
        @State var cardCount:Int
        var emojis:Array<String>
        var body: some View {
            Button(action: {
                if cardCount < emojis.count{
                    cardCount += 1
                }
            }, label: {
                Text("Add card")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            })
        }
    }

}


struct CardView:View{
    @State var isFaceUp: Bool
    var content: String
    
    var body: some View{
        ZStack(content: {
            
            let base: Circle = Circle()
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else{
                base.fill(.purple)
                Text("🧑‍💻").font(.largeTitle)
            }
        })
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}





#Preview {
    ContentView()
}



