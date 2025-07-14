import SwiftData

final class SwiftDataManager {
	
	private let context: ModelContext
	
	init(context: ModelContext) {
		self.context = context
	}
	
	func loadMainStateSnapshot() -> MainStateSnapshot? {
		
		do {
			let descriptor = FetchDescriptor<MainStateSnapshot>()
			let result = try context.fetch(descriptor)
			guard let model = result.first else { return nil }
			return model
		} catch {
			print("Fatal error -> wasn't able to extract State")
			return nil
		}
	}
	
	func saveMainStateSnapshot(model: MainStateSnapshot) {
		
		do {
			context.insert(model)
			try context.save()
		} catch {
			print("saving of the current state has been failed")
			fatalError()
		}
	}
	
	func updateMainStateSnapshot() {
		
	}
}
