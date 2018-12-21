package group4.wpilibrary;

import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.SimpleCursorAdapter;
import android.widget.Toast;

import group4.wpilibrary.constant.SQLCommand;
import group4.wpilibrary.util.DBOperator;

public class SearchByCourse_Activity extends AppCompatActivity implements View.OnClickListener {

    Button reqCourse_btn, elecCourse_btn, home_btn;
    RadioButton bookRadio, paperRadio;
    private ListView listView;
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.search_layout);


        try {
            DBOperator.copyDB(getBaseContext());
        } catch (Exception e) {
            e.printStackTrace();
        }

        listView = (ListView) this.findViewById(R.id.Courses_ListView);
        listView.setOnItemClickListener(new ItemClickListener());

        reqCourse_btn = (Button) findViewById(R.id.reqcoure_btn);
        reqCourse_btn.setOnClickListener(this);

        elecCourse_btn = (Button) findViewById(R.id.elecourse_btn);
        elecCourse_btn.setOnClickListener(this);

        bookRadio = (RadioButton) findViewById(R.id.BookRadio);
        paperRadio = (RadioButton) findViewById(R.id.PaperRadio);

        home_btn = (Button) findViewById(R.id.Home_btn);
        home_btn.setOnClickListener(this);
    }

    public void onClick(View v) {

         String test = getIntent().getStringExtra("test");



        String sql = "";
        int id = v.getId();
        if (id == R.id.Home_btn) {
            Intent intent = new Intent(SearchByCourse_Activity.this, MainActivity.class);

            startActivity(intent);
        }


        else if (id == R.id.reqcoure_btn){
            Toast.makeText(getApplicationContext(), test,Toast.LENGTH_LONG).show();
            Intent intent = this.getIntent();
            if (test.equals("IT")){
                sql = SQLCommand.Query_CourseITreq;

                Cursor cursor = DBOperator.getInstance().execQuery(sql);
                SimpleCursorAdapter adapter = new SimpleCursorAdapter(
                        getApplicationContext(), R.layout.listitem_surajpatil, cursor,
                        new String[]{"_id", "course_name"}, new int[]{
                        R.id.id, R.id.ttitle},
                        SimpleCursorAdapter.IGNORE_ITEM_VIEW_TYPE);
                        listView.setAdapter(adapter);
            }
            else if (test.equals("MAI")){
                sql = SQLCommand.Query_CourseMAIreq;
                Cursor cursor = DBOperator.getInstance().execQuery(sql);
                SimpleCursorAdapter adapter = new SimpleCursorAdapter(
                        getApplicationContext(), R.layout.listitem_surajpatil, cursor,
                        new String[]{"_id", "course_name"}, new int[]{
                        R.id.id, R.id.ttitle},
                        SimpleCursorAdapter.IGNORE_ITEM_VIEW_TYPE);
                listView.setAdapter(adapter);
            }
            else if (test.equals("CS")){
                sql = SQLCommand.Query_CourseCSreq;
                Cursor cursor = DBOperator.getInstance().execQuery(sql);
                SimpleCursorAdapter adapter = new SimpleCursorAdapter(
                        getApplicationContext(), R.layout.listitem_surajpatil, cursor,
                        new String[]{"_id", "course_name"}, new int[]{
                        R.id.id, R.id.ttitle},
                        SimpleCursorAdapter.IGNORE_ITEM_VIEW_TYPE);
                listView.setAdapter(adapter);
            }
            else if (test.equals("ROB")){
                sql = SQLCommand.Query_CourseROBreq;
                Cursor cursor = DBOperator.getInstance().execQuery(sql);
                SimpleCursorAdapter adapter = new SimpleCursorAdapter(
                        getApplicationContext(), R.layout.listitem_surajpatil, cursor,
                        new String[]{"_id", "course_name"}, new int[]{
                        R.id.id, R.id.ttitle},
                        SimpleCursorAdapter.IGNORE_ITEM_VIEW_TYPE);
                listView.setAdapter(adapter);
            }
        }



        else if (id == R.id.elecourse_btn){
            Toast.makeText(getApplicationContext(), test,Toast.LENGTH_LONG).show();
            if (test.equals("IT")){
                sql = SQLCommand.Query_CourseITelec;
                Cursor cursor = DBOperator.getInstance().execQuery(sql);
                SimpleCursorAdapter adapter = new SimpleCursorAdapter(
                        getApplicationContext(), R.layout.listitem_surajpatil, cursor,
                        new String[]{"_id", "course_name"}, new int[]{
                        R.id.id, R.id.ttitle},
                        SimpleCursorAdapter.IGNORE_ITEM_VIEW_TYPE);
                listView.setAdapter(adapter);
            }
            else if (test.equals("MAI")){
                sql = SQLCommand.Query_CourseMAIelec;
                Cursor cursor = DBOperator.getInstance().execQuery(sql);
                SimpleCursorAdapter adapter = new SimpleCursorAdapter(
                        getApplicationContext(), R.layout.listitem_surajpatil, cursor,
                        new String[]{"_id", "course_name"}, new int[]{
                        R.id.id, R.id.ttitle},
                        SimpleCursorAdapter.IGNORE_ITEM_VIEW_TYPE);
                listView.setAdapter(adapter);
            }
            else if (test.equals("CS")){
                sql = SQLCommand.Query_CourseCSelec;
                Cursor cursor = DBOperator.getInstance().execQuery(sql);
                SimpleCursorAdapter adapter = new SimpleCursorAdapter(
                        getApplicationContext(), R.layout.listitem_surajpatil, cursor,
                        new String[]{"_id", "course_name"}, new int[]{
                        R.id.id, R.id.ttitle},
                        SimpleCursorAdapter.IGNORE_ITEM_VIEW_TYPE);
                listView.setAdapter(adapter);
            }
            else if (test.equals("ROB")){
                sql = SQLCommand.Query_CourseROBelec;
                Cursor cursor = DBOperator.getInstance().execQuery(sql);
                SimpleCursorAdapter adapter = new SimpleCursorAdapter(
                        getApplicationContext(), R.layout.listitem_surajpatil, cursor,
                        new String[]{"_id", "course_name"}, new int[]{
                        R.id.id, R.id.ttitle},
                        SimpleCursorAdapter.IGNORE_ITEM_VIEW_TYPE);
                listView.setAdapter(adapter);
            }
        }
    }

    private class ItemClickListener implements AdapterView.OnItemClickListener {
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
            Cursor cursor = (Cursor) listView.getItemAtPosition(position);
            String course_id = cursor.getString(0);
            Toast.makeText(getApplicationContext(), course_id ,Toast.LENGTH_LONG).show();

            if (bookRadio.isChecked()){
                Intent intent = new Intent(SearchByCourse_Activity.this, SearchBooks_Activity.class);
                intent.putExtra("course_id", course_id);
                startActivity(intent);
            }
            else if (paperRadio.isChecked()){
                Intent intent = new Intent(SearchByCourse_Activity.this, SearchPapers_Activity.class);
                intent.putExtra("course_id", course_id);
                startActivity(intent);
            }

        }
    }

}
