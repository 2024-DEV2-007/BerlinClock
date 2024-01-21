
import Foundation

class BerlinClockViewModel: ObservableObject {
  @Published var berlinClockModel = BerlinClockModel()
  private var timer: Timer?
  
  init() {
    startClock()
  }
  
  func startClock() {
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
      let currentTime = Calendar.current.dateComponents([.hour, .minute, .second], from: Date())
      self?.berlinClockModel.updateLamps(for: currentTime)
    }
    
    // Ensure the timer is running on the main run loop
    RunLoop.main.add(timer!, forMode: .common)
  }
}
