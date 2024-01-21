
import XCTest
@testable import BerlinClock

class BerlinViewModelTest: XCTestCase {
  
  func testViewModelInitialization() {
    let viewModel = BerlinClockViewModel()
    
    XCTAssertNotNil(viewModel)
    XCTAssertNotNil(viewModel.berlinClockModel)
  }
}
