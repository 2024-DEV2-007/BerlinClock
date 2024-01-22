
import SwiftUI

struct BerlinClockView: View {
  @ObservedObject private var viewModel = BerlinClockViewModel()
  
  var body: some View {
    VStack(spacing: 10) {
      Text("Berlin Clock")
        .font(.title)
      Text("\(Date())")
      Text("seconds lamp")
      BerlinClockRow(lamps: $viewModel.berlinClockModel.secondsLamps)
      
      Text("Hours lamp")
      BerlinClockRow(lamps: $viewModel.berlinClockModel.upperHoursLamps)
      BerlinClockRow(lamps: $viewModel.berlinClockModel.lowerHoursLamps)
      
    }
    .padding()
    .onAppear {
      self.viewModel.startClock()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BerlinClockView()
    }
}
