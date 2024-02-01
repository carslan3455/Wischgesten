import SwiftUI

struct ContentView: View
{
    @State private var labeltext = "Wischgesten"
    @State private var oX: CGFloat = 0.0
    @State private var oY: CGFloat = 0.0
    
    var body: some View
    {
        VStack
        {
            AsyncImage(url: URL(string: "https://picsum.photos/300/400"))
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .gesture(DragGesture(minimumDistance: 10.0, coordinateSpace: .global)
                    .onEnded
                         {
                    delta in print(delta.translation)
                    
                    oX = delta.translation.width
                    oY = delta.translation.height
                    
                    switch (delta.translation.width, delta.translation.height)
                    {
                    case ( ...0, -50...50): // width: <= 0, height: zwischen -50 und 50
                        labeltext = "rechts nach links"
                        break
                    case ( 0..., -50...50): // width: >= 0, height: zwischen -50 und 50
                        labeltext = "links nach rechts"
                        break
                    case (-50...50, ...0):  // width: zwischen -50 und 50, height: <= 0
                        labeltext = "unten nach oben"
                        break
                    case (-50...50, 0...):  // width: zwischen -50 und 50, height: >= 0
                        labeltext = "oben nach unten"
                        break
                    default:
                        print("Nichts")
                    }
                }).offset(x: oX, y: oY) //.position(x: 200, y: 200)
            
            Spacer().frame(height: 23)
            
            Text(labeltext).font(.system(size: 23))//.position(x: 100, y: 200)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
