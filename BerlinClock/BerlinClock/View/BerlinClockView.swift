
import SwiftUI

struct BerlinClockView: View {
  @ObservedObject private var viewModel = BerlinClockViewModel()
  
  var body: some View {
    VStack(spacing: 10) {
      Text("Berlin Clock")
        .font(.title)
      Text("\(Date())")
      Text("seconds lamp")
      LampView(isOn: viewModel.berlinClockModel.secondsLamps[0].isOn, color: viewModel.berlinClockModel.secondsLamps[0].color.uiColor)
      
      Text("Hours lamp")
      BerlinClockRow(lamps: $viewModel.berlinClockModel.upperHoursLamps)
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
