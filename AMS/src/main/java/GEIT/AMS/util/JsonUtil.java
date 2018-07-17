package GEIT.AMS.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *	일반문자열 유틸.
 *
 * @author someone
 * @version 1.0.0
 */
public class JsonUtil {

	/**
	 * 로그 출력.
	 */
	@SuppressWarnings("unused")
	private static Logger logger = Logger.getLogger(JsonUtil.class);

	/**
	 * Map을 jsonString으로 변환한다.
	 *
	 * @param map Map<String, Object>.
	 * @return String.
	 */
	@SuppressWarnings("unchecked")
	public static JSONObject getJsonStringFromMap( Map<String, Object> map ) {

		JSONObject json = new JSONObject();
		if(map!=null) {
			for( Map.Entry<String, Object> entry : map.entrySet() ) {
				String key = entry.getKey();
				Object value = entry.getValue();
				if(value==null) {
					value="null";
				}
				json.put(key, value);
			}
		}
		return json;
	}
	
	/**
	 * List<Map>을 json으로 변환한다.
	 *
	 * @param list List<Map<String, Object>>.
	 * @return JSONArray.
	 */
	@SuppressWarnings("unchecked")
	public static JSONArray getJsonArrayFromList( List<Map<String, Object>> list ) {

		JSONArray jsonArray = new JSONArray();
		for( Map<String, Object> map : list ) {
			jsonArray.add( getJsonStringFromMap( map ) );
		}
		
		return jsonArray;
	}
	
	/**
	 * List<Map>을 jsonString으로 변환한다.
	 *
	 * @param list List<Map<String, Object>>.
	 * @return String.
	 */
	@SuppressWarnings("unchecked")
	public static String getJsonStringFromList( List<Map<String, Object>> list ) {

		JSONArray jsonArray = new JSONArray();
		for( Map<String, Object> map : list ) {
			jsonArray.add( getJsonStringFromMap( map ) );
		}
		
		return jsonArray.toString();
	}

	/**
	 * JsonObject를 Map<String, String>으로 변환한다.
	 *
	 * @param jsonObj JSONObject.
	 * @return String.
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> getMapFromJsonObject( JSONObject jsonObj ) {

		Map<String, Object> map = null;
		
		try {
			
			map = new ObjectMapper().readValue(jsonObj.toString(), Map.class) ;
			
		} catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return map;
	}

	/**
	 * JsonArray를 List<Map<String, String>>으로 변환한다.
	 *
	 * @param jsonArray JSONArray.
	 * @return List<Map<String, Object>>.
	 */
	public static List<Map<String, Object>> getListMapFromJsonArray( JSONArray jsonArray ) {

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		if( jsonArray != null )
		{
			int jsonSize = jsonArray.size();
			for( int i = 0; i < jsonSize; i++ )
			{
				Map<String, Object> map = JsonUtil.getMapFromJsonObject( ( JSONObject ) jsonArray.get(i) );
				list.add( map );
			}
		}
		
		return list;
	}
	
	/**
	 * List를 Chart Data의 List<String>으로 반환한다.
	 * @param list
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<String> getListValuesFromList( List<Map<String, Object>> list ) {

		List<String> ret = new ArrayList<String>();
		for( Map<String, Object> map : list ) {
			ret.add( map.values().toString() );
		}
		
		return ret;
	}
	/**
	 * Json String을 List<Map>으로 반환한다.
	 * @param String
	 * @return List<Map<String, Object>>.
	 */
	@SuppressWarnings("unchecked")
	public static List<Map<String, Object>> getListMapFromString( String Val ) {
		JSONArray array = JSONArray.fromObject(Val);
		return getListMapFromJsonArray(array);
	}
}
