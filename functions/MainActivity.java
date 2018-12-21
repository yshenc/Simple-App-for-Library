package group4.wpilibrary;

import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageButton;

import java.util.LinkedList;
import java.util.List;

import group4.wpilibrary.constant.SQLCommand;
import group4.wpilibrary.util.DBOperator;
import group4.wpilibrary.util.Pair;
import group4.wpilibrary.view.ChartGenerator;


public class MainActivity extends AppCompatActivity implements OnClickListener{

        ImageButton books_btn, papers_btn, journals_btn, search_btn, mostBorrowedBook_btn;

        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.mainpage_layout);


            try {
                DBOperator.copyDB(getBaseContext());
            } catch (Exception e) {
                e.printStackTrace();
            }


            books_btn = (ImageButton) findViewById(R.id.Books_btn);
            books_btn.setOnClickListener(this);

            papers_btn = (ImageButton) findViewById(R.id.Papers_btn);
            papers_btn.setOnClickListener(this);

            journals_btn = (ImageButton) findViewById(R.id.Journals_btn);
            journals_btn.setOnClickListener(this);

            mostBorrowedBook_btn = (ImageButton) findViewById(R.id.Mostborrowedbook_btn);
            mostBorrowedBook_btn.setOnClickListener(this);

            search_btn = (ImageButton) findViewById(R.id.Search_btn);
            search_btn.setOnClickListener(this);

        }

                public void onClick(View v) {
                    String sql = "";
                    int id = v.getId();
                    if (id == R.id.Books_btn) {
                        // show checkout list result

                        sql = SQLCommand.QUERY_BOOK;
                        Intent intent = new Intent(MainActivity.this,
                                Books_Activity.class);
                        intent.putExtra("sql", sql);
                        startActivity(intent);
                    }
                    else if (id == R.id.Papers_btn) {

                        sql = SQLCommand.QUERY_PAPER;
                        Intent intent = new Intent(MainActivity.this,
                               papers_Activity.class);
                        intent.putExtra("sql", sql);
                        startActivity(intent);
                    }
                    else if (id == R.id.Journals_btn) {

                        sql = SQLCommand.QUERY_JOURNAL;
                        Intent intent = new Intent(MainActivity.this,
                                Journals_Activity.class);
                        intent.putExtra("sql", sql);
                        startActivity(intent);
                    }
                    else if (id == R.id.Search_btn) {
                        Intent intent = new Intent(MainActivity.this,
                                Departments_Activity.class);
                        startActivity(intent);
                    }
                    else if (id == R.id.Mostborrowedbook_btn) {
                        // show summary chart
                        Cursor cursor = DBOperator.getInstance().execQuery(
                                SQLCommand.QUEARY_MostBorrowed);
                        List<Pair> pairList = new LinkedList<Pair>();
                        for (int i = 0; i < 5; i++) {
                            Pair pair = new Pair(i, 0);
                            pairList.add(pair);
                        }
                        int location=0;
                        while (cursor.moveToNext()) {
                            pairList.get(location).setCount(location);
                            pairList.get(location).setCount(
                                    Integer.parseInt(cursor.getString(1)));
                            location++;
                        }
                        Intent intent = ChartGenerator.getBarChart(getBaseContext(),
                                "Most Borrowed Books", pairList);
                        this.startActivity(intent);
                    }

                }

        }