---
title: StackOverflow Stats
description: Some activity stats from StackOverflow of selected tags
---

```sql question_stats
select * from motherduck_personal.question_stats
```

<script>
const colors = ['#5470C6', '#91CC75'];
$: options = {
  title: {
    text: 'Question Stats',
    left: 'left'
  },
  color: colors,
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'cross'
    }
  },
  grid: {
    right: '20%'
  },
  toolbox: {
    feature: {
      dataView: { show: true, readOnly: false },
      restore: { show: true },
      saveAsImage: { show: true }
    }
  },
  legend: {
    data: ['Total Questions', 'Avg. Score']
  },
  xAxis: [
    {
      type: 'category',
      axisTick: {
        alignWithLabel: true
      },
      data: question_stats.map(row => row.status)
    }
  ],
  yAxis: [
    {
      type: 'value',
      name: 'Total Questions',
      position: 'left',
      alignTicks: true,
      axisLine: {
        show: true,
        lineStyle: {
          color: colors[0]
        }
      },
      axisLabel: {
        formatter: '{value} questions'
      }
    },
    {
      type: 'value',
      name: 'Avg. Score',
      position: 'right',
      alignTicks: true,
      axisLine: {
        show: true,
        lineStyle: {
          color: colors[1]
        }
      },
      axisLabel: {
        formatter: '{value} points'
      }
    }
  ],
  series: [
    {
      name: 'Total Questions',
      type: 'bar',
      yAxisIndex: 0,
      data: question_stats.map(row => row.total_questions)
    },
    {
      name: 'Avg. Score',
      type: 'line',
      yAxisIndex: 1,
      data: question_stats.map(row => row.avg_score)
    }
  ]
};
</script>

<ECharts
  config={options}
/>
