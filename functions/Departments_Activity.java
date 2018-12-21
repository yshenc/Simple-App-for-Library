package group4.wpilibrary;

import android.content.Intent;
import android.media.Image;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;

public class Departments_Activity extends AppCompatActivity {

    ImageButton schoolOfBusiness_btn, schoolOfEngineering_btn;
    Button home_btn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.department_layout);


        schoolOfBusiness_btn = (ImageButton) findViewById(R.id.School_of_Business_btn);
        schoolOfEngineering_btn = (ImageButton) findViewById(R.id.School_of_Engineering_btn);
        home_btn = (Button) findViewById(R.id.Home_btn);



        schoolOfBusiness_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String test = "SOB ";
                Intent intent = new Intent(Departments_Activity.this, BusinessSchool_Activity.class);
                intent.putExtra("test", test);
                startActivity(intent);

            }
        });

        schoolOfEngineering_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String test = "SOE ";
                Intent intent = new Intent(Departments_Activity.this, EngineeringSchool_Activity.class);
                intent.putExtra("test", test);
                startActivity(intent);

            }
        });

        home_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Departments_Activity.this, MainActivity.class);

                startActivity(intent);

            }
        });
    }
}
