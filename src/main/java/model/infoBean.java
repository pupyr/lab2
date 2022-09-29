package model;

public class infoBean {
    private int x;
    private float y;
    private int r;

    private boolean successful;

    public infoBean() {
    }

    public infoBean(int x, float y, int r, boolean successful) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.successful=successful;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public float getY() {
        return y;
    }

    public void setY(float y) {
        this.y = y;
    }

    public int getR() {return r;}

    public void setR(int r) {
        this.r = r;
    }

    public boolean isSuccessful() {
        return successful;
    }

    public void setSuccessful(boolean successful) {
        this.successful = successful;
    }
}
