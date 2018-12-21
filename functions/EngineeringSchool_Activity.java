package group4.wpilibrary;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.Toast;

public class EngineeringSchool_Activity extends AppCompatActivity {

    Button home_btn;
    ImageButton computerScience_btn, Robotics_btn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.major_engineering_layout);


        computerScience_btn = (ImageButton) findViewById(R.id.ComputerScience_btn);
        Robotics_btn = (ImageButton) findViewById(R.id.Robotics_btn);
        home_btn = (Button) findViewById(R.id.Home_btn);
        home_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(EngineeringSchool_Activity.this, MainActivity.class);

                startActivity(intent);

            }
        });

        String test = getIntent().getStringExtra("test");
        Toast.makeText(getApplicationContext(), test, Toast.LENGTH_LONG).show();

        computerScience_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String test = "CS";
                Intent intent = new Intent(EngineeringSchool_Activity.this, SearchByCourse_Activity.class);
                intent.putExtra("test", test);
                startActivity(intent);

            }
        });

        Robotics_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String test= "ROB";
                Intent intent = new Intent(EngineeringSchool_Activity.this, SearchByCourse_Activity.class);
                intent.putExtra("test", test);
                startActivity(intent);

            }
        });



    }
}
