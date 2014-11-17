package tests
{	
	import flash.events.Event;
	
	import model.People;
	import model.Person;
	
	import mx.events.CollectionEvent;
	
	import org.flexunit.asserts.*;
	import org.flexunit.async.Async;

	public class PeopleTests
	{	
		public var people:People;
		
		[Before]
		public function setUp():void
		{
			people = new People(false);
		}
		
		[After]
		public function tearDown():void
		{
			people = null;
		}
		
		[Test(async)]
		public function loadXML():void
		{	
			Async.handleEvent(this, people, Event.COMPLETE, xmlLoaded, 1000);
			people.loadXML();
		}
		
		public function xmlLoaded(event:Event, passThroughData:*):void
		{
			// Asserts go here
			assertTrue("People loaded", people.people.length > 0);
			assertTrue("People contains people", people.people[0] is Person);
		}
		
		public function timeOut(event:Event):void
		{
			fail("Failed to load XML");
		}
		
		[Test(async)]
		[Test(expects="Error")]
		public function loadBadXML():void
		{	
			Async.failOnEvent(this, people, Event.COMPLETE, 1000);
			people.loadXML("unknown.xml");
		}
	}
}