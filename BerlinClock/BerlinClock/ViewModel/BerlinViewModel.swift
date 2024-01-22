
import Foundation

class BerlinClockViewModel: ObservableObject {
  @Published var berlinClockModel = BerlinClockModel()
  @Published var currentTime: String = ""
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
    updateCurrentTime()
  }
  
  private func updateCurrentTime() {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"
    currentTime = formatter.string(from: Date())
  }
  
  deinit {
    timer?.invalidate()
  }
}
