
import XCTest
@testable import BerlinClock

class BerlinViewModelTest: XCTestCase {
  
  func testViewModelInitialization() {
    let viewModel = BerlinClockViewModel()
    
    XCTAssertNotNil(viewModel)
    XCTAssertNotNil(viewModel.berlinClockModel)
  }
  
  func testViewModelUpdatesLamps() {
    let viewModel = BerlinClockViewModel()
    let initialLampsState = viewModel.berlinClockModel
    
    viewModel.startClock()
    
    let expectation = XCTestExpectation(description: "Wait for timer to trigger")
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 5)
    
    XCTAssertNotEqual(viewModel.berlinClockModel, initialLampsState)
  }
}
