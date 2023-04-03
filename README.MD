# Sleep Analisys

## Author
[@jfnevado](https://github.com/jfnevado)
Para acceder a la versión en Español ---> [README](https://github.com/jfnevado/Sleep-study/blob/master/README_ESP.MD)

## Introduction 

The idea of this analisys comes in mind after reading the book Saludable Mente of Marcos Vázquez, book which i recommend. The book discusses various topics related to brain health and emphasizes the importance of getting a good night's sleep for physical and psychological well-being. This piqued my curiosity and led me to want to confirm the points made in the book, learn more about sleep and see how it is affected by external factors.

I wanted to clarify that I cannot verify the quality of the data and its origin. However, the results are consistent with our knowledge about sleep.

Finally, I wanted to quote Marcos:
> Sleep is still a big mystery. From an evolutionary perspective, it seems to make little sense. While we're sleeping, we cannot hunt or reproduce. We're vulnerable to predators and other risks. However, all animals sleep. Either sleep is the biggest mistake in evolution or its importance is so great that it more than compensates for all the risks involved.

## Description

Sleep has three phases:
- Light sleep
- Deep sleep
- REM sleep

My focus in this study is to find how this phases works and the impact other factors had on them, like exercise, alcohol or age. Additionally, I will try to answer other questions, such as how many hours we should sleep and whether sleeping more hours could have negative effects.

There is no metric to determine sleep quality, so I will use other metrics to evaluate it, such as deep sleep and sleep interruptions. Although REM sleep is the most important phase, it is not affected by other factors, including sleep duration.

It's important to clarify that we can measure the duration of these phases, but not their quality.
## Process

- Data extraction
- Data cleaning
- Data transformation
- Visualization
- Dashboard  
  
During the data transformation, I created new columns to calculate the "net" sleep and perform a deeper analysis. Thanks to this data, I discovered new patterns in REM sleep. Additionally, I added age ranges.
## Used tools

  - [SQL](#archivo-sql)/SSMS
  - [Python](#archivo-python)
  - [PowerBI](#dashboard)

## Conclusions and analisys
### -REM Sleep

Unlike deep sleep and light sleep, REM sleep is hardly affected by external factors and tends to have the same duration regardless of the total length of sleep.

![density](https://github.com/jfnevado/Sleep-study/blob/master/plots/density_plot_sleep_metrics.png)
![density_percentual](https://github.com/jfnevado/Sleep-study/blob/master/plots/density_plot_sleep_percentual.png)
![kdrem](https://github.com/jfnevado/Sleep-study/blob/master/plots/kderem.png)
![lmplot](https://github.com/jfnevado/Sleep-study/blob/master/plots/lmplot1.png)

### -Deep and Light Sleep

On the other hand, deep sleep and light sleep are inversely proportional, showing a significant correlation.

![lmplot](https://github.com/jfnevado/Sleep-study/blob/master/plots/lmplot2.png)
![lmplot](https://github.com/jfnevado/Sleep-study/blob/master/plots/lmplot3.png)

### -External factors

How external factors affect sleep, having in mind that REM sleep is hardly affected by them, but deep and light sleep are directly related, as well as the number of sleep interruptions.

These are the external factors that affect sleep quality:

#### Alcohol:
 - It is the one that most affects sleep quality.
 - It considerably reduces deep sleep, in favor of light sleep.
 - It increases the number of sleep interruptions.

![alcohol](https://github.com/jfnevado/Sleep-study/blob/master/plots/alcohol.png)
#### Tobacco:
 - It increases sleep interruptions to the same extent as alcohol.
 - It reduces deep sleep, to a lower extent than alcohol.

![tabaco](https://github.com/jfnevado/Sleep-study/blob/master/plots/smoking.png)
#### Caffeine:
 - Counterintuitively, it improves sleep, although this may be due to coffee drinkers developing a certain tolerance, although it is most likely an error due to the small sample of coffee consumers.

![cafeina](https://github.com/jfnevado/Sleep-study/blob/master/plots/caffeine.png)
#### Exercise:
 - It has a very positive effect on sleep improvement.
 - It reduces awakenings and increases deep sleep.
 - The difference is really noticeable in people who exercise a lot.
 - However, overall, its impact is not as significant as that of alcohol.

![ejercicio](https://github.com/jfnevado/Sleep-study/blob/master/plots/exercise.png)

**Correlation**
![correlacion_externa](https://github.com/jfnevado/Sleep-study/blob/master/plots/externalcorrelation.png)

**Awakenings**
![despertares](https://github.com/jfnevado/Sleep-study/blob/master/plots/awakenings_external.png)

### -Demographic factors

I have created age groups to draw more relevant conclusions, differentiating those under 20, from 20 to 40, from 40 to 60, and those over 60.

Those under 20 sleep the most, but they are also the least efficient. On the contrary, we have the age group between 40 and 60, who sleep the least but are the most effective.

![edad](https://github.com/jfnevado/Sleep-study/blob/master/plots/age.png)

There is no difference by gender.
![genero](https://github.com/jfnevado/Sleep-study/blob/master/plots/gender.png)

### -Temporal factors

Regarding the importance of the day, we can see that Monday is the day when people sleep the most, and Friday is the day when people sleep the least. In terms of efficiency, Saturday stands out.

![día](https://github.com/jfnevado/Sleep-study/blob/master/plots/day.png)

### -General factors

Let's analyze the median as it is more representative of the data.

Sleep efficiency is 82.0%.

Sleep duration is 7 hours and 30 minutes, with 1 hour and 41 minutes of REM sleep,
4 hours and 16 minutes of deep sleep and finally, 1 hour and 22 minutes of light sleep.

During this time, it is normal to experience 1.0 interruptions in sleep, spending
1 hour and 17 minutes awake.

Looking for ways to improve the efficiency of our sleep and have the best possible rest, we can see that the time slot in which we sleep best is between 7 and 8 hours. We can observe that after 8 hours, there is a decrease in the quality of sleep, so increasing the hours of sleep may not always be beneficial.

![eficiciencia-tiempo](https://github.com/jfnevado/Sleep-study/blob/master/plots/kdesleep.png)


## [Dashboard](https://github.com/jfnevado/Sleep-study/blob/master/dashboard/dashboard.pdf)
![dashboard](https://github.com/jfnevado/Sleep-study/blob/master/dashboard/dashboard.png)

## [SQL file](https://github.com/jfnevado/Sleep-study/blob/master/Sleep_querys.sql)

## [Python file](https://github.com/jfnevado/Sleep-study/blob/master/main.ipynb)
## Color palette
![color_palette](https://github.com/jfnevado/Sleep-study/blob/master/dashboard/colorpalette.png)

## Run Locally
Initialize git

```bash
git init
```


Clone the project

```bash
git clone https://github.com/jfnevado/Sleep-study
```

enter the project directory

```bash
cd Sleep-study
```

Create a python virtual environment 

```bash
python -m venv <env_name>
```

Activate the conda/python environment

```bash
path\<env_name>\Script\activate
```

Install packages from requirements.txt

```bash
pip install -r requirements.txt
```

List all the packages installed

```bash
pip freeze
```