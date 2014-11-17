package tests
{
	import model.Person;
	
	import org.flexunit.asserts.*;

	public class PersonTests
	{	
		public var person:Person;
		
		[Before]
		public function setUp():void
		{
			person = new Person("Justin Mclean", "justinmclean@apache.org", "jmclean");
		}
		
		[After]
		public function tearDown():void
		{
			person = null;
		}
		
		[Test]
		public function checkPerson():void {
			assertTrue("Name is correct", person.name == "Justin Mclean");
			assertTrue("Email is correct", person.email == "justinmclean@apache.org");
			assertTrue("ID is correct", person.apacheID == "jmclean");
		}	
		
	}
}