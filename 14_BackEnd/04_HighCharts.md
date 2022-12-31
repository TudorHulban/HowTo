# HighCharts Server Side Rendering
## JSON
```json
{
   "title":{
      "text":"Steep Chart"
   },
   "xAxis":{
      "categories":[
         "Jan",
         "Feb",
         "Mar"
      ]
   },
   "series":[
      {
         "data":[
            29.9,
            71.5,
            106.4
         ]
      }
   ]
}
```
## Create Chart
```bash
highcharts-export-server -infile line.json -outfile a.png
```
## Documentation
```html
https://www.highcharts.com/docs/export-module/render-charts-serverside
```
