namespace ExampleForAwesomeApp;

uses
  Awesome,
  RemObjects.Elements.RTL,
  UIKit;

type
  [IBObject]
  RootViewController = public class(UIViewController,IAwesomeMenuDelegate)
  private
    method awesomeMenu(menu: AwesomeMenu) didSelectIndex(idx: NSInteger);
    begin

    end;

  public
    method viewDidLoad; override;
    begin
      inherited viewDidLoad;

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

      var startItem := new AwesomeMenuItem WithImage(UIImage.imageNamed('bg-addbutton.png')) highlightedImage(UIImage.imageNamed('bg-addbutton-highlighted.png'))
        ContentImage(UIImage.imageNamed('icon-plus.png')) highlightedContentImage(UIImage.imageNamed('icon-plus-highlighted.png'));

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

  end;

end.