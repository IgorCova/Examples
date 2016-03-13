//
//  AlphabetLine.swift
//  CNContactPickerDelegate
//
//  Created by Andrew Dzhur on 12/03/16.
//  Copyright © 2016 Andrew Dzhur. All rights reserved.
//

import Foundation
import Contacts

struct ContactsByAlphabet {
    var letter: String
    var contacts: [CNContact]
}

class AlphabetLine {
    //Здесь будет вычисляться то, какие контакты будут в массиве и буквы в линии.
    
    var allConacts = NSMutableArray()  //[CNContact]()//NSMutableArray()
    var сontactsByAlphabet = [ContactsByAlphabet]()
    let exceptionNames = ["Igor Cova", "Andrew Dzhur", "Дмитрий Березин", "Добрый Жук", "Андрей Кова"]
    var lineAlphabet = [String]()
    
    func contactSelection(exceptionNames: [String]) {
        requestForAllContacts()
        for contact in allConacts {
            for name in exceptionNames {
                if contact.givenName == name {
                    allConacts.removeObject(contact)
                }
            }
        }
    }
    
    func AlphabetDrawing() {
        
        // Запрашиваем все контакты
        requestForAllContacts()
        
        //Крнтакты лежат в массиве по алфивиту, теперь нужно составить AlphabetDrawing
        // сontactsByAlphabet.append(ContactsByAlphabet(letter: "TOP", contacts: []))
        for contact in allConacts {
            if let nameContact : String = contact.givenName {
                var isHave = false
                
                for var index = 0; index < сontactsByAlphabet.count; ++index {
                    if сontactsByAlphabet[index].letter == nameContact[0] {
                        isHave = true
                        break
                    }
                }
                
                if isHave == false {
                    сontactsByAlphabet.append(ContactsByAlphabet(letter: nameContact[0], contacts: []))
                }
                
            }

        }
    }
    
    func topSection() {
        сontactsByAlphabet.insert(ContactsByAlphabet(letter: "TOP", contacts: []), atIndex: 0)
        for var index = 0; index < сontactsByAlphabet.count; index++ {
            if !сontactsByAlphabet[index].contacts.isEmpty {
                
                for var y = 0; y < сontactsByAlphabet[index].contacts.count; y++ {
                    let contact = сontactsByAlphabet[index].contacts[y]
        
                    if contact.phoneNumbers[0] == сontactsByAlphabet[1].contacts[0].phoneNumbers[0] {//CNPhoneNumber(stringValue: "+79253396965") {
                        сontactsByAlphabet[0].contacts.append(contact)
                        сontactsByAlphabet[index].contacts.removeAtIndex(y)
                        //y++
                        // break
                    }
                }
            }
        }
        
    }
    
    func contactsByAlphabetDrawing() -> [ContactsByAlphabet] {
        AlphabetDrawing()
        for contact in allConacts {
            if let nameContact = contact.givenName {
                
                for var index = 0; index < сontactsByAlphabet.count; ++index {
                    if nameContact![0] == сontactsByAlphabet[index].letter {
                        сontactsByAlphabet[index].contacts.append(contact as! CNContact)
                    }
                }
            }
        }
        topSection()
        return сontactsByAlphabet
    }
    
    func requestForAllContacts() {
        let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactUrlAddressesKey, CNContactImageDataKey]
        
        let store = CNContactStore()
        
        do {
            let request = CNContactFetchRequest(keysToFetch: keysToFetch)
            try store.enumerateContactsWithFetchRequest(request) {
                contact, _ in
                self.allConacts.addObject(contact)
            }
        }
        catch{
            
        }
    }
}
