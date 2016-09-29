# ShowMeThatStatus

View controller that can be used for presenting status changes to the user, for example during API calls.

* It can be presented modally just like UIAlertView.

* It has 4 different visible states - loading, progress (loading with completion percentage), success, failure.

## Requirements: ##

- iOS 9.0+
- XCode 8.0+
- Swift 3.0+

(For Swift 2 compatibility use **swift2** branch)

## GIF example: ##

![](https://dl.dropboxusercontent.com/u/66515478/smts.gif)

## Usage: ##

* To add it to your project best way is to use *Cocoapods*:

```
pod 'ShowMeThatStatus'
```

* Example usage in your project:

```

                let vc = SMTSViewController(status: .loading, message: "Loading...")
        
        vc.addAction(withTitle: "Cancel", visibleForStates: [.progress, .loading], ofType: .cancel) {
            self.dismiss(animated: true, completion: nil)
            
            //Your action..
        }
        
        vc.addAction(withTitle: "Retry", visibleForStates: [.failure]) {
            vc.changeStatus(to: .loading, withMessage: "Loading...")
            
            //Your action..
        }
        
        vc.addAction(withTitle: "Done", visibleForStates: [.success]) {
            self.dismiss(animated: true, completion: nil)
            
            //Your action..
        }
        
        present(vc, animated: true, completion: nil)
```
* This will present StatusVC centered and will be changing height of its view automatically with simple animation based on the amount of action buttons and length of status text. 
* When adding action you can determine controller's states that action is available for which hides/unhides specific buttons on status change. 
* There are 2 types of buttons *.Default* and *.Cancel* which can have different appearance based on settings available in *SMTSStyle.swift*.

* It's possible to customise appearance in a following way (all customisable appearance parameters available in *SMTSStyle.swift*):


```

SMTSConstants.smtsStyle.backgroundColor = .blackColor()
SMTSConstants.smtsStyle.cancelButtonFont = UIFont.systemFontOfSize(15)

//etc...

```
