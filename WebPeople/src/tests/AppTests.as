package tests
{
	import components.PersonDetails;
	import components.SelectPerson;
	
	import events.PersonEvent;
	
	import model.Person;
	
	import mx.collections.ArrayCollection;
	import mx.events.FlexEvent;
	
	import org.flexunit.asserts.*;
	import org.flexunit.async.Async;
	import org.fluint.sequence.*;
	import org.fluint.uiImpersonation.UIImpersonator;

	import spark.events.IndexChangeEvent;

	public class AppTests
	{	
		public var app:WebPeople;
		public var people:ArrayCollection;
		public var helper:UIHelper;
		
		[Before(async,ui)]
		public function setUp():void
		{
			app = new WebPeople();
			people = new ArrayCollection();
			helper = new UIHelper();
			
			people.addItem(new Person("Alex Harui", "aharui@apache.org", "aharui"));
			people.addItem(new Person("Justin Mclean", "jmclean@apache.org", "jmclean"));
			people.addItem(new Person("OmPrakash Muppirala", "bigosmallm@apache.org", "bigosmallm"));
			
			Async.proceedOnEvent(this, app, FlexEvent.CREATION_COMPLETE, 1000);
			UIImpersonator.addChild(app);
		}
		
		[After]
		public function tearDown():void
		{
			UIImpersonator.removeAllChildren();
			app = null;
		}
		
		[Test(async,ui)]
		public function cursorKeys():void
		{
			var seq:SequenceRunner = new SequenceRunner(this);
			
			app.select.persons.setFocus();
			
			changeUser(seq, people[0]);
			isUserSelected(seq, app.select, app.details, 0);	
			changeUser(seq, people[1]);
			isUserSelected(seq, app.select, app.details, 1);	
			
			seq.run();
		}
		
		public function changeUser(seq:SequenceRunner, person:Person):void
		{
			seq.addStep(new SequenceCaller(app, changeList, [app.select, person]));
			seq.addStep(new SequenceWaiter(app.select.persons, IndexChangeEvent.CHANGE, 200));
		}
		
		public function changeList(select:SelectPerson, person:Person):void
		{
			 helper.changeList(select.persons, person);
		}	
		
		public function isUserSelected(seq:SequenceRunner, select:SelectPerson, details:PersonDetails, pos:int):void
		{
			seq.addStep(new SequenceCaller(details, checkUser, [details, people[pos]])); 
		}
		
		public function setPosition(select:SelectPerson, pos:int):void
		{
			select.persons.selectedItem = people[pos];
		}
		
		public function checkPosition(select:SelectPerson, pos:int):void
		{
			assertTrue("Position correct", select.persons.selectedIndex == pos);
		}
		
		protected function checkUser(details:PersonDetails, person:Person):void
		{
			assertTrue("Name correct", details.personName.text == person.name);
			assertTrue("Email correct", details.email.text == person.email);
			assertTrue("ApacheID correct", details.apacheID.text == person.apacheID);
		}
	}
}