package group4.wpilibrary.util;

/**
 * Created by User on 12/8/2017.
 */

public class Pair {

    private int book;
    private int count;

    public int getBook() {
        return book;
    }

    public void setBook(int book) {
        this.book = book;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Pair(int book, int count) {
        super();
        this.book = book;
        this.count = count;
    }
}