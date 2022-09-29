package model;

import java.util.ArrayList;

public class Beans {
    private static Beans Instance;

    public static Beans getInstance() {
        if(Instance==null) {
            Instance = new Beans();
            setBeans();
        }
        return Instance;
    }

    private static ArrayList<infoBean> beans;

    public ArrayList<infoBean> getBeans() {
        return beans;
    }

    public static void setBeans() {
        beans = new ArrayList<>();
    }

    public void addBean(infoBean bean) {
        beans.add(bean);
    }
}