//
//  HistorySheet.swift
//  SwiftNEW
//
//  Created by Ming on 11/6/2022.
//

import SwiftUI
import SwiftVB
import SwiftGlass

@available(iOS 15.0, watchOS 8.0, macOS 12.0, tvOS 17.0, *)
extension SwiftNEW {
    
    // MARK: - History List View
    public var sheetHistory: some View {
        VStack(alignment: align) {
            Spacer()
            
            Text(String(localized: "History", bundle: .module))
                .bold().font(.largeTitle)
            
            Spacer()
            
            ScrollView(showsIndicators: false) {
                ForEach(items, id: \.self) { item in
                    ZStack {
                        color.opacity(0.25)
                        Text(item.version).bold().font(.title2)
                            .foregroundColor(labelColor)
                    }.glass(radius: 15, shadowColor: color)
                    .frame(width: 75, height: 30)
                    .cornerRadius(15)
                    .padding(.bottom)
                    
                    ForEach(item.new, id: \.self) { new in
                        HStack {
                            VStack(alignment: align == .trailing ? .trailing : .leading) {
                                Text(new.title).font(.headline).lineLimit(2)
                                Text(new.subtitle).font(.subheadline).foregroundColor(.secondary).lineLimit(2)
                                Text(new.body).font(.callout).foregroundColor(.secondary).lineLimit(6)
                            }
                            Spacer()
                        }.padding(.bottom).frame(width: 450)
                    }
                }
            }
            #if !os(tvOS)
            .frame(width: 450)
            #elseif !os(macOS)
            .frame(maxHeight: UIScreen.main.bounds.height * 0.5)
            #endif
            
            Spacer()
            
            closeHistoryButton
                .padding(.bottom)
        }
        #if os(macOS)
        .padding()
        .frame(width: 600, height: 600)
        #elseif os(tvOS)
        .frame(width: 600)
        #endif
    }
}
