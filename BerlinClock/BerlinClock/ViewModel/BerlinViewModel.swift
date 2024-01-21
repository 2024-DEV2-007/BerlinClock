
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
    let currentTime = DateHelper.getCurrentDate()
    let components = DateHelper.getComponents(from: currentTime)
    berlinClockModel.updateLamps(for: components)
  }
  
  deinit {
    timer?.invalidate()
  }
}
