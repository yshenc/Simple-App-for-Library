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

public class SearchPapers_Activity extends AppCompatActivity implements View.OnClickListener {


    Button home_btn, reqPapers, elecPapers ;
    private ListView listView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.searchpapers_layout);

        listView = (ListView) this.findViewById(R.id.Papers_ListView);
        listView.setOnItemClickListener(new ItemClickListener());


        home_btn = (Button) findViewById(R.id.Home_btn);
        home_btn.setOnClickListener(this);

        reqPapers = (Button) findViewById(R.id.requirepaper_btn);
        reqPapers.setOnClickListener(this);

        elecPapers = (Button) findViewById(R.id.electivepaper_btn);
        elecPapers.setOnClickListener(this);

        String course_id = getIntent().getStringExtra("course_id");
        Toast.makeText(this, course_id, Toast.LENGTH_SHORT).show();


    }

    public void onClick(View v) {

        String course_id = getIntent().getStringExtra("course_id");
        String sql = "";
        int id = v.getId();
        if (id == R.id.Home_btn) {
            Intent intent = new Intent(SearchPapers_Activity.this, MainActivity.class);

            startActivity(intent);
        }
        else if (id == R.id.electivepaper_btn) {

            sql = SQLCommand.Query_PaperElec;
            sql = sql + '"' + course_id + '"' ;
            Cursor cursor = DBOperator.getInstance().execQuery(sql);
            SimpleCursorAdapter adapter = new SimpleCursorAdapter(
                    getApplicationContext(), R.layout.listitem_surajpatil, cursor,
                    new String[]{"_id", "paper_title"}, new int[]{
                    R.id.id, R.id.ttitle},
                    SimpleCursorAdapter.IGNORE_ITEM_VIEW_TYPE);
            listView.setAdapter(adapter);
        }
        else if(id == R.id.requirepaper_btn){
            sql = SQLCommand.Query_PaperReq;
            sql = sql + '"' + course_id + '"' ;
            Cursor cursor = DBOperator.getInstance().execQuery(sql);
            SimpleCursorAdapter adapter = new SimpleCursorAdapter(
                    getApplicationContext(), R.layout.listitem_surajpatil, cursor,
                    new String[]{"_id", "paper_title"}, new int[]{
                    R.id.id, R.id.ttitle},
                    SimpleCursorAdapter.IGNORE_ITEM_VIEW_TYPE);
            listView.setAdapter(adapter);
        }
    }

    private class ItemClickListener implements AdapterView.OnItemClickListener {
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
            Cursor cursor = (Cursor) listView.getItemAtPosition(position);
            String paper_id = cursor.getString(0);
            //Toast.makeText(getApplicationContext(), paper_id ,Toast.LENGTH_LONG).show();
            String details = "";
            Cursor cursor1 = DBOperator.getInstance().execQuery(SQLCommand.QUERY_PaperDetails, new String[] {paper_id});
            cursor1.moveToFirst();
            paper_id = cursor1.getString(0);
            String paper_title = cursor1.getString(1);
            String paper_desc = cursor1.getString(2);
            String paper_qoh = cursor1.getString(3);
            String paper_location = cursor1.getString(4);
            String Journal_id = cursor1.getString(5);

            details = "Paper ID: " + paper_id + "\nPaper Title: " + paper_title + "\nPaper Description :" + paper_desc + "\nQuantity on Hand: " + paper_qoh + "\nPaper Location in Library: " + paper_location + "\nID of the Journal it is published in : " + Journal_id;

            Intent intent = new Intent(SearchPapers_Activity.this, Details_Activity.class);
            intent.putExtra("details", details);
            startActivity(intent);

        }
    }
}
