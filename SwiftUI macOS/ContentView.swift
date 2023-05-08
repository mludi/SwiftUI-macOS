import SwiftUI

enum PageItem: String, Identifiable, CaseIterable {
    case ironMan = "Iron Man"
    case hulk = "Hulk"
    case wanda = "Wanda"
    case blackWidow = "Black Widow"
    case groot = "Groot"

    var id: Self { self }

    var title: String {
        rawValue
    }

    var systemImageName: String? {
        switch self {
        case .ironMan: return "person"
        case .blackWidow: return "person.circle"
        default: return nil
        }
    }
}

struct ContentView: View {
    @State private var selectedPageItem: PageItem.ID?

    var body: some View {
        NavigationSplitView {
            List(PageItem.allCases, selection: $selectedPageItem) { pageItem in
                Label {
                    Text(pageItem.title)
                } icon: {
                    if let imageName = pageItem.systemImageName {
                        Image(systemName: imageName)
                    }
                }
            }
        } detail: {
            if let selectedPage = PageItem.allCases.first(where: { $0.id == selectedPageItem }) {
                switch selectedPage {
                case .ironMan, .blackWidow, .hulk:
                    Text("Selected \(selectedPage.title) 🥳")
                default:
                    Text("Hero has no case 😥")
                }
            }
        }
        .onAppear {
            selectedPageItem = PageItem.allCases.first?.id
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

