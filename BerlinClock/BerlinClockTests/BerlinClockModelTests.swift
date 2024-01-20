
import XCTest
@testable import BerlinClock

class BerlinClockModelTests: XCTestCase {
  
  var model: BerlinClockModel!
  
  override func setUp() {
    super.setUp()
    model = BerlinClockModel()
  }
  
  override func tearDown() {
    model = nil
    super.tearDown()
  }
  
  func testUpdateSecondsLamps() {
    model.updateSecondsLamps(for: 12)
    XCTAssertTrue(model.secondsLamps[0].isOn)
    XCTAssertEqual(model.secondsLamps[0].color, .berlinYellow)
  }
  
  func testUpdateUppperHoursHoursLamps() {
    model.updateUppperRowHoursLamps(for: 5)
    XCTAssertEqual(model.upperHoursLamps, [Lamp(color: .berlinRed, isOn: true), Lamp(color: .berlinGray, isOn: false), Lamp(color: .berlinGray, isOn: false), Lamp(color: .berlinGray, isOn: false)])
    
    model.updateUppperRowHoursLamps(for: 23)
    XCTAssertEqual(model.upperHoursLamps, [Lamp(color: .berlinRed, isOn: true), Lamp(color: .berlinRed, isOn: true), Lamp(color: .berlinRed, isOn: true), Lamp(color: .berlinRed, isOn: true)])
  }
  
  func testUpdateLowerHoursLamps() {
    model.updateLowerRowHoursLamps(for: 5)
    XCTAssertEqual(model.lowerHoursLamps, [Lamp(color: .berlinGray, isOn: false), Lamp(color: .berlinGray, isOn: false), Lamp(color: .berlinGray, isOn: false), Lamp(color: .berlinGray, isOn: false)])
    
    model.updateLowerRowHoursLamps(for: 16)
    XCTAssertEqual(model.lowerHoursLamps, [Lamp(color: .berlinRed, isOn: true), Lamp(color: .berlinGray, isOn: false), Lamp(color: .berlinGray, isOn: false), Lamp(color: .berlinGray, isOn: false)])
  }
  
  func testUpdateUpperMinutesLamps() {
    model.updateUpperMinutesLamps(for: 43)
    XCTAssertEqual(model.upperMinutesLamps,
                   [Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinRed, isOn: true), // 3rd red lamp
                    Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinRed, isOn: true), // 6th red lamp
                    Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinGray, isOn: false),// 9th red lamp
                    Lamp(color: .berlinGray, isOn: false),
                    Lamp(color: .berlinGray, isOn: false)])
  }
  
  func testUpdateLowerMinutesLamps() {
    model.updateLowerMinutesLamps(for: 43)
    XCTAssertEqual(model.lowerMinutesLamps,
                   [Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinGray, isOn: false)])
  }
  
  func testUpdateSecondsLampsWithDateCompontes() {
    let dateComponents = DateComponents(second: 45)
    model.updateLamps(for: dateComponents)
    XCTAssertEqual(model.secondsLamps, [Lamp(color: .berlinGray, isOn: false)])
  }
  
  func testUpdateUpperHoursLampsWithDateCompontes() {
    let dateComponents = DateComponents(hour: 16)
    model.updateLamps(for: dateComponents)
    
    XCTAssertEqual(model.upperHoursLamps, [Lamp(color: .berlinRed, isOn: true), Lamp(color: .berlinRed, isOn: true), Lamp(color: .berlinRed, isOn: true), Lamp(color: .berlinGray, isOn: false)])
  }
  
  func testUpdateLowerHoursLampsWithDateCompontes() {
    let dateComponents = DateComponents(hour: 16)
    model.updateLamps(for: dateComponents)
    
    XCTAssertEqual(model.lowerHoursLamps, [Lamp(color: .berlinRed, isOn: true), Lamp(color: .berlinGray, isOn: false), Lamp(color: .berlinGray, isOn: false), Lamp(color: .berlinGray, isOn: false)])
  }
  
  func testUpdateUpperMinutesLampsWithDateCompontes() {
    let dateComponents = DateComponents(minute: 43)
    model.updateLamps(for: dateComponents)
    
    XCTAssertEqual(model.upperMinutesLamps,
                   [Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinRed, isOn: true), // 3rd red lamp
                    Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinRed, isOn: true), // 6th red lamp
                    Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinYellow, isOn: true),
                    Lamp(color: .berlinGray, isOn: false),// 9th red lamp
                    Lamp(color: .berlinGray, isOn: false),
                    Lamp(color: .berlinGray, isOn: false)])
  }
}
