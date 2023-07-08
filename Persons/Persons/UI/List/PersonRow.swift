//
//  PersonRow.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import SwiftUI

struct PersonRow: View {
    var person = KisilerModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(person.name ?? "Noname")
                .font(.system(size: 25))
            Text("Phone: \(person.phone ?? "00")")
                .font(.system(size: 20))
                .foregroundColor(.gray)
        }
    }
}

struct PersonRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonRow()
    }
}
