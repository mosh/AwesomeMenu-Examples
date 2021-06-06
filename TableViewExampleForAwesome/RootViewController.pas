namespace TableViewExampleForAwesome;

uses
  Awesome,
  RemObjects.Elements.Rtl,
  UIKit;

type
  [IBObject]
  RootViewController = public class(UITableViewController,IAwesomeMenuDelegate)
  private
    method awesomeMenu(menu: AwesomeMenu) didSelectIndex(idx: NSInteger);
    begin

    end;

  public

    constructor;
    begin
      inherited  constructor withStyle(UITableViewStyle.UITableViewStylePlain);
    end;

    method viewDidLoad; override;
    begin
      inherited viewDidLoad;

      title := 'TableViewExampleForAwesome';

      // Uncomment the following line to preserve selection between presentations.
      // clearsSelectionOnViewWillAppear := false;

      // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
      // navigationItem.rightBarButtonItem := editButtonItem;

      // Do any additional setup after loading the view.

      var storyMenuItemImage := UIImage.imageNamed("bg-menuitem.png");
      var storyMenuItemImagePressed := UIImage.imageNamed("bg-menuitem-highlighted.png");
      var starImage := UIImage.imageNamed("icon-star.png");


      var starMenuItem1: AwesomeMenuItem := new AwesomeMenuItem WithImage(storyMenuItemImage) highlightedImage(storyMenuItemImagePressed) ContentImage(starImage) highlightedContentImage(nil);
      var starMenuItem2: AwesomeMenuItem := new AwesomeMenuItem WithImage(storyMenuItemImage) highlightedImage(storyMenuItemImagePressed) ContentImage(starImage) highlightedContentImage(nil);
      var starMenuItem3: AwesomeMenuItem := new AwesomeMenuItem WithImage(storyMenuItemImage) highlightedImage(storyMenuItemImagePressed) ContentImage(starImage) highlightedContentImage(nil);
      var starMenuItem4: AwesomeMenuItem := new AwesomeMenuItem WithImage(storyMenuItemImage) highlightedImage(storyMenuItemImagePressed) ContentImage(starImage) highlightedContentImage(nil);
      var starMenuItem5: AwesomeMenuItem := new AwesomeMenuItem WithImage(storyMenuItemImage) highlightedImage(storyMenuItemImagePressed) ContentImage(starImage) highlightedContentImage(nil);

      var menus := new NSMutableArray<AwesomeMenuItem>;
      menus.addObjectsFromArray([starMenuItem1,starMenuItem2,starMenuItem3,starMenuItem4,starMenuItem5]);

      var startItem := new AwesomeMenuItem WithImage(UIImage.imageNamed("bg-addbutton.png")) highlightedImage(nil)
        ContentImage(UIImage.imageNamed("icon-plus.png")) highlightedContentImage(nil);
      var menu := new AwesomeMenu WithFrame(self.view.bounds) startItem(startItem) optionMenus(menus);
      menu.delegate := self;
      menu.menuWholeAngle := M_PI_2;
      menu.farRadius := 110.0;
      menu.endRadius := 100.0;
      menu.nearRadius := 90.0;
      menu.animationDuration := 0.3;
      menu.startPoint := CGPointMake(50.0, 410.0);

      self.view.addSubview(menu);

    end;

    method didReceiveMemoryWarning; override;
    begin
      inherited didReceiveMemoryWarning;

      // Dispose of any resources that can be recreated.

    end;

    //
    // Table view data source
    //

    method numberOfSectionsInTableView(tableView: UITableView): NSInteger;
    begin
      {$WARNING Potentially incomplete method implementation.}
      // Return the number of sections.
      result := 1;
    end;

    method tableView(tableView: UITableView) numberOfRowsInSection(section: NSInteger): NSInteger;
    begin
      {$WARNING Potentially incomplete method implementation.}
      // Return the number of rows in the section.
      result := 0;
    end;

    method tableView(tableView: UITableView) cellForRowAtIndexPath(indexPath: NSIndexPath): UITableViewCell;
    begin
      var CellIdentifier := "RootViewControllerCell";

      result := tableView.dequeueReusableCellWithIdentifier(CellIdentifier);
      if not assigned(result) then begin
        result := new UITableViewCell withStyle(UITableViewCellStyle.UITableViewCellStyleDefault) reuseIdentifier(CellIdentifier);

        // Configure the new cell, if necessary...
      end;

      // Configure the individual cell...
    end;

    method tableView(tableView: UITableView) canEditRowAtIndexPath(indexPath: NSIndexPath): Boolean;
    begin
      // Return "false" if you do not want the specified item to be editable.
      result := true;
    end;

    method tableView(tableView: UITableView) commitEditingStyle(editingStyle: UITableViewCellEditingStyle) forRowAtIndexPath(indexPath: NSIndexPath);
    begin
      if (editingStyle = UITableViewCellEditingStyle.UITableViewCellEditingStyleDelete) then begin
        // Delete the row from the data source
        tableView.deleteRowsAtIndexPaths([indexPath]) withRowAnimation(UITableViewRowAnimation.UITableViewRowAnimationFade);
      end
      else if (editingStyle = UITableViewCellEditingStyle.UITableViewCellEditingStyleInsert) then begin
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
      end;
    end;

    method tableView(tableView: UITableView) canMoveRowAtIndexPath(indexPath: NSIndexPath): Boolean;
    begin
      // Return "false" if you do not want the item to be re-orderable.
      result := true;
    end;

    method tableView(tableView: UITableView) moveRowAtIndexPath(fromIndexPath: NSIndexPath) toIndexPath(toIndexPath: NSIndexPath);
    begin
    end;

    method tableView(tableView: UITableView) didSelectRowAtIndexPath(indexPath: NSIndexPath);
    begin
      // Navigation logic may go here. Create and push another view controller.
      (*
      var detailViewController := new DetailViewController withNibName(@'...') bundle(nil);
      // ...
      // Pass the selected object to the new view controller.
      navigationController.pushViewController(detailViewController) animated(true);
      *)
    end;

  end;

end.