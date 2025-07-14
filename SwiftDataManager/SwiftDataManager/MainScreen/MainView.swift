import SwiftUI

struct MainView: View {
	
	@StateObject var viewModel: MainViewModel
	
	init(viewModel: MainViewModel) {
		
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
	
    var body: some View {
        VStack {
			Text("\(viewModel.mainStateSnapshot.items)")
			
			HStack {
				Spacer()
				Button("Add Item") {
					viewModel.addItem()
				}
				Spacer()
				Button("Remove Item") {
					viewModel.removeItem()
				}
				Spacer()
			}
			
			HStack {
				Spacer()
				Button("Save to SwiftData") {
					viewModel.saveItemsToSwiftData()
				}
				Button("Load from SwiftData") {
					viewModel.loadItemsFromSwiftData()
				}
			}
        }
        .padding()
    }
}
