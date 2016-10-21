class AlphabetController < UIViewContoller 
  def viewDidLoad
    super 

    self.title = "Alphabet"

    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    #a views bound returns a CGRect (like view.frame) but has empty origin point
    #essentially says to size newView to fill view 
    self.view.addSubview @table 
  end 
end 