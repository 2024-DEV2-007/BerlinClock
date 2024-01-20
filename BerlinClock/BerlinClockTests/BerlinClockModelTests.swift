
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
    XCTAssertEqual(model.secondsLamps[0].color, .yellow)
  }
  
  func testUpdateUppperHoursHoursLamps() {
    model.updateUppperRowHoursLamps(for: 5)
    XCTAssertEqual(model.upperHoursLamps, [Lamp(color: .red, isOn: true), Lamp(color: .gray, isOn: false), Lamp(color: .gray, isOn: false), Lamp(color: .gray, isOn: false)])
    
    model.updateUppperRowHoursLamps(for: 23)
    XCTAssertEqual(model.upperHoursLamps, [Lamp(color: .red, isOn: true), Lamp(color: .red, isOn: true), Lamp(color: .red, isOn: true), Lamp(color: .red, isOn: true)])
  }
  
  func testUpdateLowerHoursLamps() {
    model.updateLowerRowHoursLamps(for: 5)
    XCTAssertEqual(model.lowerHoursLamps, [Lamp(color: .gray, isOn: false), Lamp(color: .gray, isOn: false), Lamp(color: .gray, isOn: false), Lamp(color: .gray, isOn: false)])
    
    model.updateLowerRowHoursLamps(for: 16)
    XCTAssertEqual(model.lowerHoursLamps, [Lamp(color: .red, isOn: true), Lamp(color: .gray, isOn: false), Lamp(color: .gray, isOn: false), Lamp(color: .gray, isOn: false)])
  }
}
