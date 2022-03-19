//
//  BasicCard.swift
//  MyLazyGrid
//
//  Created by 박힘찬 on 2022/03/19.
//

import SwiftUI

struct BasicCard: View {
    
    var title: String
    var detail: String
    var imgName: String
    var bgColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: imgName)
                .padding(.leading)
                .font(.system(size: 50))
            
            VStack(alignment: .leading, spacing: 0) {
                Rectangle()
                    .frame(height: 0)
                Text(title)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Color.white)
                Spacer().frame(height: 5)
                Text(detail)
            }
            .padding()
        }
        //.padding()
        .background(bgColor)
        .cornerRadius(15)
    }
}

struct BasicCard_Previews: PreviewProvider {
    static var previews: some View {
        BasicCard(title: "힘찬의 일상", detail: "10AM - 18AM", imgName: "play.fill", bgColor: Color.brown)
    }
}
