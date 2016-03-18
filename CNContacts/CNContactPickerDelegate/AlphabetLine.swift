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
    let exceptionNumber = ["79253396965", "79264308272", "79164913669"]
    var lineAlphabet = [String]()
    
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
            for var y = 0; y < сontactsByAlphabet[index].contacts.count; y++ {
                let contact = сontactsByAlphabet[index].contacts[y]
                    
                for number in exceptionNumber {
                    for lableNumber in contact.phoneNumbers {
                        if number == stringNumber((lableNumber.value as! CNPhoneNumber).stringValue)  {
                            сontactsByAlphabet[0].contacts.append(contact)
                            сontactsByAlphabet[index].contacts.removeAtIndex(y)
                            print("Успешно")
                            break
                        }
                    }
                }
            }
        }
        сontactsByAlphabet[0].contacts.sortInPlace({$0.givenName < $1.givenName})
        cleaner()
    }
    
    func cleaner() {
        for var index = 0; index < сontactsByAlphabet.count; index++ {
            if сontactsByAlphabet[index].contacts.isEmpty {
                сontactsByAlphabet.removeAtIndex(index)
                index--
            }
        }
    }
    
    func stringNumber(number: String) -> String {
        let stringArray = number.componentsSeparatedByCharactersInSet(
            NSCharacterSet.decimalDigitCharacterSet().invertedSet)
        let newString = stringArray.joinWithSeparator("")
        
        return newString
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
