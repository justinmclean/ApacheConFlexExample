package model
{
	[Bindable]
	public class Person
	{
		public var name:String;
		public var email:String;
		public var apacheID:String;
		
		public function Person(name:String, email:String, apacheID:String)
		{
			this.name = name;  
			this.email = email;  
			this.apacheID = apacheID;
		}
	}
}