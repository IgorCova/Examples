/*
* Copyright (c) 2016 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import Cocoa
import WebKit

class ViewController: NSViewController {
  
  @IBOutlet weak var webView: WebView!
  @IBOutlet weak var outlineView: NSOutlineView!
  var feeds = [Feed]()
  let dateFormatter = NSDateFormatter()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dateFormatter.dateStyle = .ShortStyle
    
    if let filePath = NSBundle.mainBundle().pathForResource("Feeds", ofType: "plist") {
      feeds = Feed.feedList(filePath)
      print(feeds)
    }
  }
  
  @IBAction func doubleClickedItem(sender: NSOutlineView) {
    //1
    let item = sender.itemAtRow(sender.clickedRow)
    
    //2
    if item is Feed {
      //3
      if sender.isItemExpanded(item) {
        sender.collapseItem(item)
      } else {
        sender.expandItem(item)
      }
    }
  }
  
  override func keyDown(theEvent: NSEvent) {
    interpretKeyEvents([theEvent])
  }
  
  override func deleteBackward(sender: AnyObject?) {
    //1
    let selectedRow = outlineView.selectedRow
    if selectedRow == -1 {
      return
    }
    
    //2
    outlineView.beginUpdates()
    //3
    if let item = outlineView.itemAtRow(selectedRow) {
      
      //4
      if let item = item as? Feed {
        //5
        if let index = self.feeds.indexOf( {$0.name == item.name} ) {
          //6
          self.feeds.removeAtIndex(index)
          //7
          outlineView.removeItemsAtIndexes(NSIndexSet(index: selectedRow), inParent: nil, withAnimation: .SlideLeft)
        }
      } else if let item = item as? FeedItem {
        //8
        for feed in self.feeds {
          //9
          if let index = feed.children.indexOf( {$0.title == item.title} ) {
            feed.children.removeAtIndex(index)
            outlineView.removeItemsAtIndexes(NSIndexSet(index: index), inParent: feed, withAnimation: .SlideLeft)
          }
        }
      }
    }
    outlineView.endUpdates()
  }
}

extension ViewController: NSOutlineViewDataSource {
  func outlineView(outlineView: NSOutlineView, numberOfChildrenOfItem item: AnyObject?) -> Int {
    //1
    if let feed = item as? Feed {
      return feed.children.count
    }
    //2
    return feeds.count
  }
  
  func outlineView(outlineView: NSOutlineView, child index: Int, ofItem item: AnyObject?) -> AnyObject {
    if let feed = item as? Feed {
      return feed.children[index]
    }
    
    return feeds[index]
  }
  
  func outlineView(outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool {
    if let feed = item as? Feed {
      return feed.children.count > 0
    }
    
    return false
  }
}

extension ViewController: NSOutlineViewDelegate {
  func outlineView(outlineView: NSOutlineView, viewForTableColumn tableColumn: NSTableColumn?, item: AnyObject) -> NSView? {
    var view: NSTableCellView?
    //1
    if let feed = item as? Feed {
      if tableColumn?.identifier == "DateColumn" {
        view = outlineView.makeViewWithIdentifier("FeedCell", owner: self) as? NSTableCellView
        if let textField = view?.textField {
          textField.stringValue = ""
          textField.sizeToFit()
        }
      } else {
        view = outlineView.makeViewWithIdentifier("FeedCell", owner: self) as? NSTableCellView
        if let textField = view?.textField {
          textField.stringValue = feed.name
          textField.sizeToFit()
        }
      }
    } else if let feedItem = item as? FeedItem {
      //1
      if tableColumn?.identifier == "DateColumn" {
        //2
        view = outlineView.makeViewWithIdentifier("FeedCell", owner: self) as? NSTableCellView
        
        if let textField = view?.textField {
          //3
          textField.stringValue = dateFormatter.stringFromDate(feedItem.publishingDate)
          textField.sizeToFit()
        }
      } else {
        //4
        view = outlineView.makeViewWithIdentifier("FeedCell", owner: self) as? NSTableCellView
        if let textField = view?.textField {
          //5
          textField.stringValue = feedItem.title
          textField.sizeToFit()
        }
      }
    }
    //More code here
    return view
  }
  
  func outlineViewSelectionDidChange(notification: NSNotification) {
    //1
    guard let selectedIndex = notification.object?.selectedRow else {
      return
    }
    //2
    if let feedItem = notification.object?.itemAtRow(selectedIndex) as? FeedItem {
      //3
      let url = NSURL(string: feedItem.url)
      //4
      if let url = url {
        //5
        self.webView.mainFrame.loadRequest(NSURLRequest(URL: url))
      }
    }
  }
}