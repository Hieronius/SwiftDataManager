import SwiftUI
import SwiftData

@Model
final class MainStateSnapshot {
	
	var items: Int
	
	init(items: Int) {
		self.items = items
	}
}
