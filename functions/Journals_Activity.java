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

import group4.wpilibrary.constant.SQLCommand;
import group4.wpilibrary.util.DBOperator;

public class Journals_Activity extends AppCompatActivity {

    private ListView listView;
    Button home_btn;
   // go to Papers_Activity after clicking on one of the journals
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.journals_layout);

        listView = (ListView) this.findViewById(R.id.list_of_journals);
        listView.setOnItemClickListener(new ItemClickListener());

        Intent intent = this.getIntent();
        String sql = intent.getStringExtra("sql");
        // execute the sql
        Cursor cursor = DBOperator.getInstance().execQuery(sql);
        // bind the data to list
        SimpleCursorAdapter adapter = new SimpleCursorAdapter(
                getApplicationContext(), R.layout.listitem_surajpatil, cursor,
                new String[]{"_id","journal_title"}, new int[]{
                R.id.id, R.id.ttitle},
                SimpleCursorAdapter.IGNORE_ITEM_VIEW_TYPE);
        listView.setAdapter(adapter);


        home_btn = (Button) findViewById(R.id.Home_btn);
        home_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Journals_Activity.this, MainActivity.class);
                startActivity(intent);
            }
        });
    }
    private class ItemClickListener implements AdapterView.OnItemClickListener {
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
            Cursor cursor = (Cursor) listView.getItemAtPosition(position);
            String Journal_id = cursor.getString(0);
            //Toast.makeText(getApplicationContext(), paper_id ,Toast.LENGTH_LONG).show();

            //Cursor cursor1 = DBOperator.getInstance().execQuery(SQLCommand.QUERY_PaperDetails, new String[] {paper_id});





            String sql = SQLCommand.Query_PapersByJournals;
            sql = sql + '"' + Journal_id + '"' ;
           //Toast.makeText(getApplicationContext(), sql ,Toast.LENGTH_LONG).show();

            Intent intent = new Intent(Journals_Activity.this, papers_Activity.class);
            intent.putExtra("sql", sql);
            startActivity(intent);
        }
    }
}
