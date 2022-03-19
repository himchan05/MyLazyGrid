//
//  ContentView.swift
//  MyLazyGrid
//
//  Created by 박힘찬 on 2022/03/19.
//

import SwiftUI

enum Grid {
    case one, two, three
    
    var gridItem: [GridItem] {
        switch self {
        case .one: return [GridItem(.flexible(minimum: 0))]
        case .two: return [GridItem(.flexible(minimum: 50)),
                           GridItem(.flexible(minimum: 50))]
        case .three: return [GridItem(.flexible(minimum: 50)),
                             GridItem(.flexible(minimum: 50)),
                             GridItem(.flexible(minimum: 50))]
        }
    }
}

struct ContentView: View {
    @State var selectedItem: Grid = .one
    let dummyDataArray: [MyModel] = MyModel.dummyDataArray
    
    var body: some View {
        VStack {
            Picker(" ", selection: $selectedItem) {
                Image(systemName: "rectangle.grid.1x2.fill").tag(Grid.one)
                Image(systemName: "rectangle.grid.2x2.fill").tag(Grid.two)
                Image(systemName: "rectangle.grid.3x2.fill").tag(Grid.three)
            }
            .pickerStyle(.segmented)
            
            ScrollView {
                LazyVGrid(columns: selectedItem.gridItem) {
                    ForEach(dummyDataArray, id: \.self) { item in
                        switch self.selectedItem {
                        case .one:
                            BasicCard(title: "힘찬의 일상 \(item.title)", detail: "10AM - 18AM", imgName: "play.fill", bgColor: Color.brown)
                        case .two:
                            ZStack {
                                Rectangle()
                                    .frame(height: 200)
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8897296786, blue: 0.9394766688, alpha: 0.8470588235)))
                                    .cornerRadius(15)
                                VStack {
                                    Circle()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(Color(#colorLiteral(red: 0.6497921348, green: 1, blue: 0.8020958304, alpha: 0.8470588235)))
                                    Text("Number : \(item.title)")
                                    Text("Sub Title : \(item.detail)")
                                }
                            }
                        case .three:
                            Rectangle()
                                .frame(height: UIScreen.main.bounds.size.width / 3)
                                .foregroundColor(Color(#colorLiteral(red: 0.6391098499, green: 0.5917937756, blue: 1, alpha: 0.8470588235)))
                        }
                    }
                }
            }
        }
    }
}
    
struct MyModel: Hashable {
    var id = UUID()
    var title: String
    var detail: String
    
    static var dummyDataArray: [MyModel] {
        (1...500).map { (number: Int) in
                         MyModel(title: "Title \(number)", detail: "Detail \(number)")}
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
