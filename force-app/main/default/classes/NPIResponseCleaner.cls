public class NPIResponseCleaner {

	public class Addresses {
		public String telephone_number;
	}

	public class Results {
		public String numberX;
		public List<Addresses> addresses;
	}

	public Integer result_count;
	public List<Results> results;

	
	public static NPIResponseCleaner parse(String json) {
		return (NPIResponseCleaner) System.JSON.deserialize(json.replace('"number"', '"numberX"'), NPIResponseCleaner.class);
	}
}