# Circular Progress Bar


## Usage
### - without Storyboard

#### - declare
var progressBar : CircularProgressBar!

#### - initialize
##### - on its own
let frame = CGRect(x: 0, y: 0, width: 50, height: 50)

##### - or use containing view 
let frame = view.frame
#### create view
progressBar = CircularProgressBar(frame: frame)


This application demonstrates how to use CircularProgressBar. 

## Public functions and variables
### var lineWidth: CGFloat
When set it changes the lineWidth of the progress bar

### var labelSize: CGFloat
When set it changes the label size of the progress bar

### var safePercent: Int
Safe percent is the percent when we want the circular progress bar to be green

### setProgress(to progressConstant: Double, withAnimation: Bool)
Used to set the progress of the progress bar

####    progressConstant: Double 
Value between 0.00 to 1.00

####    withAnimation: Bool
true if you want to use animation else false