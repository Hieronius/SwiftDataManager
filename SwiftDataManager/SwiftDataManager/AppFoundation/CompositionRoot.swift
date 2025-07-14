import SwiftData

@MainActor
final class CompositionRoot {
	
	var modelContainer: ModelContainer
	var swiftDataManager: SwiftDataManager
	
	init() {
		
		do {
			self.modelContainer = try ModelContainer.init(for: MainStateSnapshot.self)
			
			self.swiftDataManager = SwiftDataManager(context: self.modelContainer.mainContext)
			print("CompositionRoot init complete")
			
		} catch {
			fatalError("Failed to Construct CompositionRoot")
		}
		
	}
	
	@MainActor
	func buildMainView() -> MainView {
		
		let mainStateSnapshot = self.swiftDataManager.loadMainStateSnapshot() ?? MainStateSnapshot(items: 1)
		
		let viewModel = MainViewModel(swiftDataManager: self.swiftDataManager,
									  mainStateSnapshot: mainStateSnapshot)
		let view = MainView(viewModel: viewModel)
		print("MainView has been made")
		return view
	}
}
