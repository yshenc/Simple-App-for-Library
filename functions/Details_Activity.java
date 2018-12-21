package group4.wpilibrary;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class Details_Activity extends AppCompatActivity {


    Button home_btn;
    TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.detail_layout);

        String details = getIntent().getStringExtra("details");
        textView = (TextView) findViewById(R.id.details_TV);

        textView.setText(details);


        home_btn = (Button) findViewById(R.id.Home_btn);
        home_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Details_Activity.this, MainActivity.class);

                startActivity(intent);

            }
        });
    }
}
