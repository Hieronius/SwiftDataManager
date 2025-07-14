import SwiftUI

final class MainViewModel: ObservableObject {
	
	private let swiftDataManager: SwiftDataManager
	@Published var mainStateSnapshot: MainStateSnapshot
	
	init(swiftDataManager: SwiftDataManager,
		 mainStateSnapshot: MainStateSnapshot) {
		
		self.swiftDataManager = swiftDataManager
		self.mainStateSnapshot = mainStateSnapshot
	}
	
	func addItem() {
		mainStateSnapshot.items += 1
	}
	
	func removeItem() {
		mainStateSnapshot.items -= 1
	}
	
	func saveItemsToSwiftData() {
		swiftDataManager.saveMainStateSnapshot(model: self.mainStateSnapshot)
		print("state has been saved")
	}
	
	func loadItemsFromSwiftData() {
		guard let state = swiftDataManager.loadMainStateSnapshot() else { return }
		self.mainStateSnapshot = state
	}
}
