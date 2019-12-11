/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author AMIN
 */
public class UserMap {
    
    private HashMap<String, String> userMap;
    private static UserMap instance;
    
    private UserMap() {
        userMap = new HashMap<>();
    }

    public HashMap<String, String> getUserMap() {
        return userMap;
    }
    
    public static UserMap getInstance() {
        if (instance == null) {
            instance = new UserMap();
        }
        return instance;
    }
    
    public boolean checkExist(String username, String password) {
        if (userMap.get(username) == null) return false;
        return userMap.get(username).equals(password);
    }
    
    public void add(String username, String password) {
        userMap.put(username, password);
    }
    
    public void load() {
        String path = "users.txt"; //file in <tomcat version>/bin
        
        try {
            FileReader fr = new FileReader(path);
            BufferedReader br = new BufferedReader(fr);
            String line = br.readLine();
            while (line != null) {                
                String[] s = line.split(", ");
                if (!checkExist(s[0], s[1])) userMap.put(s[0], s[1]);
                line = br.readLine();
            }
            br.close();
            fr.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void save() {
        String path = "users.txt";
        
        try {
            FileWriter fw = new FileWriter(path);
            BufferedWriter bw = new BufferedWriter(fw);
            for (Map.Entry<String, String> entry : userMap.entrySet()) {
                String username = entry.getKey();
                String password = entry.getValue();
                bw.write(username + ", " + password);
                bw.newLine();
            }
            bw.close();
            fw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
