package group4.wpilibrary;

import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;
import android.widget.Toast;

import group4.wpilibrary.constant.SQLCommand;
import group4.wpilibrary.util.DBOperator;

public class SearchBooks_Activity extends AppCompatActivity implements View.OnClickListener {

    Button home_btn, reqBooks, elecBooks;
    private ListView listView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.search_books);

        home_btn = (Button) findViewById(R.id.Home_btn);
        home_btn.setOnClickListener(this);

        reqBooks = (Button) findViewById(R.id.requirebook_btn);
        reqBooks.setOnClickListener(this);

        elecBooks = (Button) findViewById(R.id.electivebooks_btn);
        elecBooks.setOnClickListener(this);

        listView = (ListView) this.findViewById(R.id.Books_ListView);
        listView.setOnItemClickListener(new ItemClickListener());



        String course_id = getIntent().getStringExtra("course_id");
        Toast.makeText(this, course_id , Toast.LENGTH_SHORT).show();


    }

    public void onClick(View v) {


        String sql = "";
        int id = v.getId();
        if (id == R.id.Home_btn) {
            Intent intent = new Intent(SearchBooks_Activity.this, MainActivity.class);

            startActivity(intent);
        }
        else if (id == R.id.electivebooks_btn) {
            String course_id = getIntent().getStringExtra("course_id");
            sql = SQLCommand.Query_BookElec;
            sql = sql + '"' + course_id + '"' ;
            Cursor cursor = DBOperator.getInstance().execQuery(sql);
            SimpleCursorAdapter adapter = new SimpleCursorAdapter(
                    getApplicationContext(), R.layout.listitem_surajpatil, cursor,
                    new String[]{"_id", "book_title"}, new int[]{
                    R.id.id, R.id.ttitle},
                    SimpleCursorAdapter.IGNORE_ITEM_VIEW_TYPE);
            listView.setAdapter(adapter);
        }
        else if(id == R.id.requirebook_btn){
            String course_id = getIntent().getStringExtra("course_id");
            sql = SQLCommand.Query_BookReq;
            sql = sql + '"' + course_id + '"' ;
            Cursor cursor = DBOperator.getInstance().execQuery(sql);
            SimpleCursorAdapter adapter = new SimpleCursorAdapter(
                    getApplicationContext(), R.layout.listitem_surajpatil, cursor,
                    new String[]{"_id", "book_title"}, new int[]{
                    R.id.id, R.id.ttitle},
                    SimpleCursorAdapter.IGNORE_ITEM_VIEW_TYPE);
            listView.setAdapter(adapter);
        }
    }

    private class ItemClickListener implements AdapterView.OnItemClickListener {
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
            Cursor cursor = (Cursor) listView.getItemAtPosition(position);
            String book_id = cursor.getString(0);
            Toast.makeText(getApplicationContext(), book_id ,Toast.LENGTH_LONG).show();
            String details = "";
            Cursor cursor1 = DBOperator.getInstance().execQuery(SQLCommand.QUERY_BookDetails, new String[] {book_id});
            cursor1.moveToFirst();
            book_id = cursor1.getString(0);
            String book_title = cursor1.getString(1);
            String book_desc = cursor1.getString(2);
            String book_edition = cursor1.getString(3);
            String book_publisher = cursor1.getString(4);
            String book_qoh = cursor1.getString(5);
            String book_location = cursor1.getString(6);
            String borrow_num = cursor1.getString(7);

            details = "Book ID: " + book_id + "\nBook Title: " + book_title + "\nBook Description :" + book_desc + "\nBook Edition: " + book_edition + "\nBook Publisher :" + book_publisher + "\nQuantity on Hand: " + book_qoh + "\nBook Location in Library: " + book_location + "\nNumber of times book Borrowed: " + borrow_num;

            Intent intent = new Intent(SearchBooks_Activity.this, Details_Activity.class);
            intent.putExtra("details", details);
            startActivity(intent);

        }
    }
}
