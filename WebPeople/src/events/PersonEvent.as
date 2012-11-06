package events
{
	import flash.events.Event;
	
	import model.Person;
	
	public class PersonEvent extends Event
	{
		public static const SELECT_PERSON:String = "selectPerson";
		
		private var _person:Person;
		
		public function get person():Person
		{
			return _person;
		}
		
		public function PersonEvent(type:String, person:Person, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			_person = person;
		}

		public override function clone():Event
		{
			return new PersonEvent(type, person, bubbles, cancelable);
		}

	}
}