/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 *
 * @author satonana 文字列からJsonへの変換 きれい樹形
 */
public class String2Json {
    //node=樹形構造の根幹、中心点
    public static JsonNode getJsonNode(String jsonString) {
        JsonNode head = null;
        try {
            JsonFactory jfactory = new JsonFactory();
            JsonParser parser = jfactory.createJsonParser(jsonString);
            //Json文字列をJavaのHashMapに変換
            ObjectMapper mapper = new ObjectMapper();
            head = mapper.readTree(parser);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return head;
    }
}
