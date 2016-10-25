class AlphabetController < UIViewController 
  def viewDidLoad
    super 

    self.title = "Alphabet"

    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    #a views bound returns a CGRect (like view.frame) but has empty origin point
    #essentially says to size newView to fill view 
    self.view.addSubview @table 
    @table.dataSource = self 
    @table.delegate = self 
    @data = ("A".."Z").to_a 
  end 

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    p indexPath
    p indexPath.row 
    @reuseIdentifier ||= "CEll_IDENTIFIER"  
    #if nil/false assign the value 

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin 
      #grabs cell with identifier if nil run begin/end block and create a new UITableViewCell 
      #w/style and reuseIdentifier 
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end 
    cell.textLabel.text = @data[indexPath.row]
    cell 
  end 

  def tableView(tableView, numberOfRowsInSection:section)
    @data.count 
  end 

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    p indexPath
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    alert = UIAlertView.alloc.init
    alert.message = "#{@data[indexPath.row]} tapped!"
    alert.addButtonWithTitle "OK"
    alert.show
  end 
end 