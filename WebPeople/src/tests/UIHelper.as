package tests
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.controls.ComboBox;
	import mx.core.UIComponent;
	import mx.events.ListEvent;
	
	import spark.components.Button;
	import spark.components.CheckBox;
	import spark.components.List;
	import spark.components.TextInput;
	import spark.components.supportClasses.ListBase;
	import spark.events.IndexChangeEvent;
	import spark.events.TextOperationEvent;
	
	public class UIHelper
	{
		public function UIHelper()
		{
		}

		// simulate a list box change
		public function changeList(list:ListBase, value:Object):void {
			
			for each (var item:Object in list.dataProvider) {
				if (item.name == value.name) {
					list.selectedItem = item;
					break;
				}
			}
			list.dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGING));
			list.dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE));
		}

	}
}