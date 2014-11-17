package tests
{
	import components.SelectPerson;
	
	import events.PersonEvent;
	
	import flash.events.Event;
	
	import model.Person;
	
	import mx.collections.ArrayCollection;
	import mx.events.FlexEvent;
	
	import org.flexunit.asserts.*;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;

	public class SelectPersonTests
	{	
		public var selectPerson:SelectPerson;
		public var people:ArrayCollection;
		
		public var helper:UIHelper;
		
		[Before(async,ui)]
		public function setUp():void
		{
			selectPerson = new SelectPerson();
			people = new ArrayCollection();
			helper = new UIHelper();
			
			people.addItem(new Person("Alex Harui", "aharui@apache.org", "aharui"));
			people.addItem(new Person("Justin Mclean", "jmclean@apache.org", "jmclean"));
			people.addItem(new Person("OmPrakash Muppirala", "bigosmallm@apache.org", "bigosmallm"));
			
			selectPerson.people = people;
			Async.proceedOnEvent(this, selectPerson, FlexEvent.CREATION_COMPLETE, 100);
			UIImpersonator.addChild(selectPerson);
		}
		
		[After]
		public function tearDown():void
		{
			UIImpersonator.removeAllChildren();
			selectPerson = null;
			people = null;
		}
		
		[Test]
		public function initialSelected():void {
			assertTrue("Correct person selected", selectPerson.selectedPerson == null);
		}
	
		[Test]
		public function changeSelected():void
		{
			selectPerson.changePerson(people[2]);
			assertTrue("Correct person selected", selectPerson.selectedPerson == people[2]);
		}
		
		[Test]
		public function changetoNobody():void
		{
			selectPerson.changePerson(null);
			assertTrue("Correct person selected", selectPerson.selectedPerson == null);
		}
		
		[Test(async,ui)]
		public function onChange():void
		{
			Async.handleEvent(this, selectPerson, PersonEvent.SELECT_PERSON, personSelected, 100);
			helper.changeList(selectPerson.persons, people[2]);
		}
		
		public function personSelected(event:PersonEvent, passThroughData:*):void
		{
			assertTrue("Event contains correct person", event.person == people[2]);
		}	
	}
}