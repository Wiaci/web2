package history;

public class Note {
    private final double x;
    private final double y;
    private final double r;
    private final String answer;
    private final String date;
    private final long time;

    public Note(double x, double y, double r, String answer, String date, long time) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.answer = answer;
        this.date = date;
        this.time = time;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public String getAnswer() {
        return answer;
    }

    public String getDate() {
        return date;
    }

    public long getTime() {
        return time;
    }
}
