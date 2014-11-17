package model
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;

	public class People extends EventDispatcher
	{
		[Bindable] public var people:ArrayCollection = new ArrayCollection();
		
		public function People(autoLoad:Boolean = true)
		{
			if (autoLoad) {
				loadXML();
			}
		}
		
		public function loadXML(file:String = "./data/people.xml"):void
		{
			var request:URLRequest = new URLRequest(file);
			var loader:URLLoader = new URLLoader();

			loader.addEventListener(Event.COMPLETE, xmlLoaded);
			loader.addEventListener(IOErrorEvent.IO_ERROR, xmlError);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, xmlError);
			loader.load(request);
		}
		
		protected function xmlLoaded(event:Event):void
		{
			var data:XMLList = XML(event.target.data).person;
			var converted:Array = [];
			
			for each (var person:XML in data) {
				converted.push(new Person(person.@name, person.@email, person.@apacheid));
			}
			
			people = new ArrayCollection(converted);
			dispatchEvent(event);
		}
		
		protected function xmlError(event:Event):void
		{
			throw new Error("Unable to load people XML");
		}
	}
}