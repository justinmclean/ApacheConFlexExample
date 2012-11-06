package model
{
	import mx.collections.ArrayCollection;

	public class People
	{
		[Bindable] public var people:ArrayCollection = new ArrayCollection([
			new Person("Alex Harui", "aharui@apache.org", "aharui"),
			new Person("Carol Frampton", "cframpton@apache.org", "cframpton"),
			new Person("Christophe Herreman", "cherreman@apache.org", "cherreman"),
			new Person("Erik de Bruin ", "erikdebruin@apache.org", "erikdebruin"),
			new Person("Garth Braithwait", "garthdb@apache.org", "garthdb"),
			new Person("Gordon Smith", "gordonsmith@apache.org", "gordonsmith"),
			new Person("Igor Costa", "igorcosta@apache.org", "igorcosta"),
			new Person("Jeffry Houser", "jhouser@apache.org", "jhouser"),
			new Person("Jonathon Campos", "jonbcampos@apache.org", "jonbcampos"),
			new Person("Jun Heider", "junheider@apache.org", "junheider"),
			new Person("Justin Mclean", "jmclean@apache.org", "jmclean"),
			new Person("Leif Wells", "leifwells@apache.org", "leifwells"),
			new Person("Martin Heidegger", "mheidegger@apache.org", "mheidegger"),
			new Person("Michael Labriola", "labriola@apache.org", "labriola"),
			new Person("Michael Schmalle", "mschmalle@apache.org", "mschmalle"),
			new Person("Omar Gonzalez", "s9tpepper@apache.org", "s9tpepper"),
			new Person("OmPrakash Muppirala", "bigosmallm@apache.org", "bigosmallm"),
			new Person("Peter Elst", "peterelst@apache.org", "peterelst"),
			new Person("Sebastian Mohr", "masuland@apache.org", "masuland"),
			new Person("Tink", "tink@apache.org", "tink")
		]);
		
		public function People()
		{
		}
	}
}