package group4.wpilibrary;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.Toast;

public class BusinessSchool_Activity extends AppCompatActivity {


    Button home_btn;
    ImageButton informationTechnology_btn, marketingAndInnovation_btn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.major_business_layout);
        informationTechnology_btn = (ImageButton) findViewById(R.id.InformationTechnology_btn);
        marketingAndInnovation_btn = (ImageButton) findViewById(R.id.MarketingInnovation_btn);
        home_btn = (Button) findViewById(R.id.Home_btn);

        home_btn.clearFocus();
        home_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(BusinessSchool_Activity.this, MainActivity.class);
                startActivity(intent);
            }
        });

        String test = getIntent().getStringExtra("test");
        Toast.makeText(getApplicationContext(), test,Toast.LENGTH_LONG).show();


        informationTechnology_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String test ="IT";
                Intent intent = new Intent(BusinessSchool_Activity.this, SearchByCourse_Activity.class);
                intent.putExtra("test", test);
                startActivity(intent);

            }
        });

        marketingAndInnovation_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String test = "MAI";
                Intent intent = new Intent(BusinessSchool_Activity.this, SearchByCourse_Activity.class);
                intent.putExtra("test", test);
                startActivity(intent);

            }
        });




    }
}
