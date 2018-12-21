package group4.wpilibrary.view;

/**
 * Created by User on 11/6/2017.
 */

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Paint.Align;

import org.achartengine.ChartFactory;
import org.achartengine.chart.BarChart;
import org.achartengine.model.CategorySeries;
import org.achartengine.model.XYMultipleSeriesDataset;
import org.achartengine.renderer.XYMultipleSeriesRenderer;
import org.achartengine.renderer.XYSeriesRenderer;

import java.util.List;

import group4.wpilibrary.util.Pair;

public class ChartGenerator{

    private static double yMaxNum=0.0;
    /*
     * A Render defining char styles Including title, text color, background
     * colors, etc.
     */
    private static XYMultipleSeriesRenderer mRenderer=new XYMultipleSeriesRenderer();
    private static XYSeriesRenderer renderer=new XYSeriesRenderer();

    static {
        mRenderer.setChartTitleTextSize(40);
        mRenderer.setLabelsTextSize(20);
        mRenderer.setLegendTextSize(20);
        mRenderer.setZoomEnabled(false,false);
        mRenderer.setYLabelsAlign(Align.RIGHT);
        mRenderer.setShowGridY(true);
        mRenderer.setXLabelsColor(Color.RED);
        mRenderer.setYLabelsColor(0,Color.RED);
        mRenderer.setXLabels(0);
        String[]books=new String[]{"C++", "Harry Potter","Java", "Fantasy World", "Great Advanture"};
        for(int i=0;i<books.length;i++){
            mRenderer.addXTextLabel(i+1,books[i]);
        }
        mRenderer.setShowGridX(true);
        mRenderer.setXTitle("Name of the Book");
        mRenderer.setYTitle("Borrowed Count");
        mRenderer.setAxisTitleTextSize(20);
        mRenderer.setMargins(new int[]{80,40,60,40});
        mRenderer.setPanEnabled(false,false);
        mRenderer.setZoomButtonsVisible(false);
        mRenderer.setBarSpacing(1.0f);
        //mRenderer.setBarWidth(2.5f);
        mRenderer.setXAxisMin(0);
        mRenderer.setXAxisMax(6);
        mRenderer.setYAxisMin(50);
        mRenderer.setXLabelsPadding(5.0f);
        renderer.setColor(Color.BLUE);
        renderer.setDisplayChartValues(true);
        renderer.setChartValuesTextAlign(Align.RIGHT);
        renderer.setChartValuesTextSize(20f);

        mRenderer.addSeriesRenderer(renderer);
    }

    private static XYMultipleSeriesDataset createDataSet(List<Pair> pairList){
        XYMultipleSeriesDataset mDataset=new XYMultipleSeriesDataset();
        CategorySeries series=new CategorySeries("Borrowed Count / Name of the Book");
        for(Pair pair:pairList){
            if(pair.getCount()>yMaxNum){
                yMaxNum=pair.getCount();
            }
            series.add(pair.getBook()+"",pair.getCount());
        }
        mRenderer.setYAxisMax(yMaxNum+1.0);
        mDataset.addSeries(series.toXYSeries());
        return mDataset;
    }

    /**
     * Get a bar chart
     *
     * @param context
     * @param pairList
     * @return
     */
    public static Intent getBarChart(Context context,String title,
                                     List<Pair> pairList){
        mRenderer.setChartTitle(title);
        return ChartFactory.getBarChartIntent(context,createDataSet(pairList),
                mRenderer,BarChart.Type.DEFAULT);
    }

    /**
     * Get a line chart
     *
     * @param context
     * @param pairList
     * @return
     */
    public static Intent getLineChart(Context context,String title,
                                      List<Pair> pairList){
        mRenderer.setChartTitle(title);
        return ChartFactory.getLineChartIntent(context,
                createDataSet(pairList),mRenderer);
    }

}
