class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'HelloMotion'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    # navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    # @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    # @window.rootViewController = navigationController
    # @window.makeKeyAndVisible

    # alert = UIAlertView.new 
    # alert.message = "Hello Motion!"
    # alert.show

    # puts "Hello Again!"


    # @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    # #make window with dimensions of the screen 
    # @window.rootViewController = TapController.alloc.initWithNibName(nil, bundle: nil)#used to load controller from a NIB file
    # #the window will take the controller and adjust its view size to fit the window

    # @window.makeKeyAndVisible
    #tells OS window will be the one receiving touvh events and that it should
    #become visbile on the screen

    # @blue_view = UIView.alloc.initWithFrame(CGRectMake(10, 10, 100, 100))
    # #create a new view, it sits stored as a CGREct object 
    # #CGRect is a compositionof CGPoint and CGSize
    # #
    # @blue_view.backgroundColor = UIColor.blueColor
    # @window.addSubview(@blue_view)

    # @green_view = UIView.alloc.initWithFrame(CGRectMake(30, 30, 40, 40))
    # @green_view.backgroundColor = UIColor.greenColor
    # @window.addSubview(@green_view)

    # @red_view  = UIView.alloc.initWithFrame(CGRectMake(30, 30, 40, 40))
    # @red_view.backgroundColor = UIColor.redColor
    #   # NOTE: *not* adding to @window
    # @blue_view.addSubview(@red_view)



    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    nav_controller = UINavigationController.alloc.initWithRootViewController(controller)
    alphabet_controller = AlphabetController.alloc.initWithNibName(nil, bundle: nil)

    # other_controller = UIViewController.alloc.initWithNibName(nil, bundle: nil)
    # other_controller.title = "Other"
    # other_controller.view.backgroundColor = UIColor.purpleColor


    tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle:nil)
    tab_controller.viewControllers = [alphabet_controller, nav_controller]
    #set tab controller's viewControllers to an array with navigation contorller 
    @window.rootViewController = tab_controller
    
    @window.makeKeyAndVisible

    @points = [[0,0],[50,0],[0,50],[50,50]]
    @current_index = 0 

    @view = UIView.alloc.initWithFrame [@points[@current_index], [100,100]]#shorthand for CGRectMake
    #first sub-array represents the origin and second the size 
    @view.backgroundColor = UIColor.blueColor
    @window.addSubview(@view)

    animate_to_next_point


    true
  end

  def animate_to_next_point
    @current_index += 1

    #keep current_index in the range [0,3]
    @current_index = @current_index % @points.count 

    UIView.animateWithDuration(2, 
      #duration sets how long the animations will last, in seconds.
      animations:lambda {
      @view.frame = [@points[@current_index], [100,100]]
      }, 
      completion:lambda{ |finished|
        #must accept an argument in this lambda; it will be a boolean value which tells you if the animations really did finish. 
        self.animate_to_next_point
      }
    )
  end 
end
