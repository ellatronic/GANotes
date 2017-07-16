//
//  ViewController.swift
//  FoundationClassesLesson
//
//  Created by Wellington Moreno on 9/14/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    private var dates: [Date] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDates()
        setDates()
    }
    
    private func loadDates() {
        
        //Load the dates file
        guard let file = Files.loadFile(filename: "Dates") else { return }
        
        //This method goes through each line in the string.
        //It works sort of like a for loop, calling the block
        //of code for each line in the string
        file.enumerateLines() {
            //The inout stop parameter is something we can use to tell
            //the operation to stop or keep going.
            //If we change it to false, the String will stop going through the lines
            //Therefore it functions a bit like the `break` keyword.
            (line: String, stop: inout Bool) in
            
            //The date is coming in as a String first
            let dateAsString = line
            //Then we want to convert it to an Integer
            //Epoch time is a special format where a date is represented
            //as the number of seconds since January 1st 1970
            //TimeIntervale is just an alias for the `Double` data type.
            guard let epochTime = TimeInterval(dateAsString)
            else {
                print("Failed to convert date to EpochTime: \(dateAsString)")
                //If we fail, let's skip this line and keep going
                return
            }
            
            //Once we have the epoch time, we can create a Date object from it
            //It's important that we cann the timeIntervalSince1970 when
            //creating date objects from Epoch time.
            let date = Date(timeIntervalSince1970: epochTime)
            
            //Once we have the date, let's add it to our array
            self.dates.append(date)
        }
    }

    
    private func setDates() {
        
        //Create a variable that will contain the string we want to display to our text view
        var stringToDisplay = ""
        
        for date in dates {
            
            //Computers understand Epoch time, Humans don't
            //So we need a translation
            //Convert the date into a human-readable string
            let dateAsString = humanReadableString(fromDate: date)
            
            //Now that we have the current date as a String, add it to the overall string
            //taking care to add a new line at the end
            stringToDisplay += dateAsString + "\n"
        }
        
        //Once we have added all of the dates to the string,
        //display it on the text view
        self.textView.text = stringToDisplay
        
    }
    
    private func humanReadableString(fromDate date: Date) -> String {
        
        //Create the date formatter object
        let formatter = DateFormatter()
        //Set the date style to medium.
        //Refer to the `CFDateFormatterStyle` enum for specific instructions
        formatter.dateStyle = DateFormatter.Style.medium
        
        //Use the formatter to convert the date into a string
        let dateAsString = formatter.string(from: date)
        return dateAsString
    }

}

