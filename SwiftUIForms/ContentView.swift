//
//  ContentView.swift
//  SwiftUIForms
//
//  Created by Sinan Ulusan on 23.12.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var nameSurname: String = ""
    @State var phoneNumber: String = ""
    @State var isActive: Bool = true
    @State var notificationEnable: Bool = false
    @State private var pickerMode = 0
    var optionPicker = ["Her zaman", "Yalnızca Kullanırken", "Kilitliyken", "Asla"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Kullanıcı Bilgisi")){
                    TextField("İsim Soyisim", text: $nameSurname)
                    TextField("Telefon Numarası", text: $phoneNumber)
                    Toggle(isOn: $isActive) {
                        Text("Hesap Aktif")
                    }
                }
                
                Section(header: Text("Bildirimler")) {
                    Toggle(isOn: $notificationEnable) {
                        Text("Etkinleştirildi")
                    }
                    
                    Picker(selection: $pickerMode, label: Text("Önizlemeler")) {
                        ForEach(0..<optionPicker.count) {
                            Text(self.optionPicker[$0])
                        }
                    }
                }
                
                Section(header: Text("Hakkında")) {
                    HStack {
                        Text("Yazılım Versiyonu")
                        Spacer()
                        Text("14.3")
                    }
                }
                
                Section(header: Text("Temizle")) {
                    Button(action: {
                        print("Eylemi Başlat")
                    }) {
                        Text("Sıfırla")
                    }
                }
            }
            .navigationBarTitle("Ayarlar")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
