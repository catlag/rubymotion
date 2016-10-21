class TapController < UIViewController

  def viewDidLoad #lifecycle method 

    super #always call super 

    self.view.backgroundColor = UIColor.whiteColor

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    #use CGRectZero frame without know the exact dimension of text on screen
    @label.text = "Taps (#{self.navigationController.viewControllers.count})"
    @label.sizeToFit
    #label resizes itself to fit 
    @label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)
    #center label within view
    self.view.addSubview(@label)

    self.title = "Tap"

    right_button = UIBarButtonItem.alloc.initWithTitle("Push", style: UIBarButtonItemStyleBordered, target:self, action:'push')
    #create button Target is the object you want to call the action function on 
    self.navigationItem.rightBarButtonItem = right_button
    #add to navigation container 
  

  end 

  def push 
    new_controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(new_controller, animated:true)
    #pushes the passed controller to the stack will also add back button by default 
  end 

  def initWithNibName(name, bundle: bundle)
    super 
    self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemFavorites, tag:1)
    self 
  end 


end 