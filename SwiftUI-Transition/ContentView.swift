import SwiftUI


struct ContentView: View {
    @State private var include = false
    
    let easeFn = Animation.easeInOut(duration: 1)
    
    var body: some View {
        VStack {
            VStack {
                if include {
                    Text("Conditionally Included")
                        .frame(maxWidth: .infinity) // use full screen width
                    
                        // This slides in from left and out to right.
                        //.transition(.slide)
                    
                        // The animation call here should apply the
                        // easing function when one is not specified
                        // in the call to withAnimation, but it doesn't work.
                        //.transition(.slide.animation(easeFn))
                    
                        .transition(.asymmetric(
                            insertion: .move(edge: .top),
                            removal: .move(edge: .trailing)
                        ))
                        
                        // This changes scale from 0 to 1 for insertion
                        // and 1 to 0 for removal.
                        //.transition(.scale)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 50) // use full width
            .border(.red)
            
            NavigationView {
                Form {
                    // If a Toggle is used instead of a Button
                    // to toggle the value of "include",
                    // there is no opportunity to use "withAnimation".
                    //Toggle("Include Optional Text?", isOn: $include)
                    
                    Button("Toggle Optional Text") {
                        //withAnimation {
                        withAnimation(easeFn) {
                            include.toggle()
                        }
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
