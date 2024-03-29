
import SwiftUI

struct BerlinClockView: View {
  @ObservedObject private var viewModel = BerlinClockViewModel()
  
  var body: some View {
    VStack(spacing: 10) {
      Text("Berlin Clock")
        .font(.title)
      Text("seconds lamp")
      BerlinClockRow(lamps: $viewModel.berlinClockModel.secondsLamps)
      
      Text("Hours lamp")
      BerlinClockRow(lamps: $viewModel.berlinClockModel.upperHoursLamps)
      BerlinClockRow(lamps: $viewModel.berlinClockModel.lowerHoursLamps)
      
      
      Text("Minutes lamp")
      BerlinClockRow(lamps: $viewModel.berlinClockModel.upperMinutesLamps)
      BerlinClockRow(lamps: $viewModel.berlinClockModel.lowerMinutesLamps)
      
      
      DigitalClockView(currentTime: $viewModel.currentTime)
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
