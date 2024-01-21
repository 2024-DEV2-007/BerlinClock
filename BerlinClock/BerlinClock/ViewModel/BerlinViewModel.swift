
import Foundation

class BerlinClockViewModel: ObservableObject {
  @Published var berlinClockModel = BerlinClockModel()
  private var timer: Timer?
  
  init() {
    startClock()
  }
  
  func startClock() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
    RunLoop.main.add(timer!, forMode: .common)
  }
  
  @objc private func updateClock() {
    let currentTime = Calendar.current.dateComponents([.hour, .minute, .second], from: Date())
    berlinClockModel.updateLamps(for: currentTime)
  }
  
  deinit {
    timer?.invalidate()
  }
}
