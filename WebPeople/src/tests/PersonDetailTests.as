package tests
{
	import components.PersonDetails;
	import components.SelectPerson;
	
	import model.Person;
	
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	
	import org.flexunit.asserts.*;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;

	public class PersonDetailTests
	{	
		public var personDetails:PersonDetails;
		public var person:Person;
		
		[Before(async,ui)]
		public function setUp():void
		{
			personDetails = new PersonDetails();
			person = new Person("Justin Mclean", "justinmclean@apache.org", "jmclean");
			
			personDetails.person = person;
			
			Async.proceedOnEvent(this, personDetails, FlexEvent.CREATION_COMPLETE, 100);
			UIImpersonator.addChild(personDetails);
		}
		
		[After]
		public function tearDown():void
		{
			UIImpersonator.removeAllChildren();
			personDetails = null;
			person = null;
		}
		
		[Test]
		public function initialSelected():void
		{
			assertTrue("Name correct", personDetails.personName.text == "Justin Mclean");
			assertTrue("Email correct", personDetails.email.text == "justinmclean@apache.org");
			assertTrue("ApacheID correct", personDetails.apacheID.text == "jmclean");
		}
		
		[Test(async)]
		public function selectPerson():void {
			var newPerson:Person = new Person("OmPrakash Muppirala", "bigosmallm@apache.org", "bigosmallm");
			personDetails.person = newPerson;
			assertTrue("Name correct", personDetails.personName.text == "OmPrakash Muppirala");
			assertTrue("Email correct", personDetails.email.text == "bigosmallm@apache.org");
			assertTrue("ApacheID correct", personDetails.apacheID.text == "bigosmallm");
		}
		
	}
}