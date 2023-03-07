# Análisis del sueño

## Author
[@jfnevado](https://github.com/jfnevado)

## Introdución 

La idea de realizar este análisis nace del libro Saludable Mente, de Marcos Vázquez, que aprovecho para recomendar, un gran libro. Entre otros temas habla sobre la importancia física y psicológica de un buen descanso.

Antes de nada me gustaría aclarar que no puedo confirmar la calidad del origen de la data, aún así se ha tratado lo mejor posible y los resultados son bastante coherentes con lo que conocemos del descanso.

Para terminar la introducción voy a citar a Marcos:
> El sueño sigue siendo un gran misterio. Evolutivamente parece tener poco sentido. Mientras dormimos, no podemos cazar ni reproducirnos. Somos vulnerables a depredadores y a todo tipo de invasores. Y sin embargo, todos los animales duermen. O bien el sueño es el mayor error de la evolución o es tan importante que compensó con creces todos los riesgos que implicaba.

## Descripción

El sueño consta de tres fases:
- Sueño ligero
- Sueño profundo
- Sueño REM

El objetivo de este estudio es encontrar como se desarrollan estas diferntes fases y el impacto que tienen en el sueño otros factores, como el ejercicio, el consumo de alcohol o la edad. A su vez intentaremos dar respuesta a preguntas como, ¿cuántas horas es recomendable dormir?

Para determinar la calidad de sueño vamos a medir la cantida de sueño profundo y el número de interrupciones que se producen. Aunque el factor más importante del sueño es la fase REM, como veremos más adelante, esta fase practicamente se ve afectada por otros factores, incluso la duración del sueño.

Es importante aclarar que solo podemos cuantificar como afectan a la duración de estas fases, pero no a su calidad.

## Procesos

- Recolección de la data
  - SQL

- Limpieza de la data
  - SQL
  - Python
  
- Transformación de la data
  - Python
  
- Visualización
  - Python

- Dashboard
  - PowerBI

## Análisis y conclusiones

### -Sueño REM

A diferencia del sueño profundo y el ligero, el sueño REM apenas se ve afectado por factores externos, incluso tiende a tener la misma duración independientemente de la duración del sueño.

![density](https://github.com/jfnevado/Sleep-study/blob/master/plots/density_plot_sleep_metrics.png)
![density_percentual](https://github.com/jfnevado/Sleep-study/blob/master/plots/density_plot_sleep_percentual.png)
![kdrem](https://github.com/jfnevado/Sleep-study/blob/master/plots/kderem.png)
![lmplot](https://github.com/jfnevado/Sleep-study/blob/master/plots/lmplot1.png)

#### -Sueño profundo y ligero

Por otro lado el sueño profundo y el ligero son inversamente proporcionales, mostrando una correlación enorme.

![lmplot](https://github.com/jfnevado/Sleep-study/blob/master/plots/lmplot2.png)
![lmplot](https://github.com/jfnevado/Sleep-study/blob/master/plots/lmplot3.png)

#### -Factores externos

Como influyen los factores externos en el sueño, no sin antes recordar que el sueño REM prácticamente no se ve afectado por ellos, pero si el sueño profundo y ligero, que estan directamente relacionados, al igual que la cantidad de interrupciones del sueño.

Así es como influyen en la calidad de sueño los siguientes factores externos:

Alcohol:
 - Es el que más afecta a la calidad de sueño.
 - Reduce considerablemente el sueño profundo, en beneficio del sueño ligero.
 - Aumenta la cantidad de interrupciones del sueño.

Tabaco:
 - Aumenta las interrupciones del sueño en la misma medida que el alcohol.
 - Reduce el sueño profundo, en menor medida que el alcohol.


Cafeína:
 - Contraintuitivamente mejora el sueño, aunque esto puede deberse a que la muestra de consumidores de café es muy 

Ejercicio:
 - Tiene un efecto muy positivo con la mejora del sueño.
 - Reduce los despertares y aumenta el sueño profundo.
 - La diferencia se hace realmente notable en la gente que practica mucho deporte.
 - Aún así, en general, su impacto no es tan significativo como el del alcohol.

![alcohol](https://github.com/jfnevado/Sleep-study/blob/master/plots/alcohol.png)
![tabaco](https://github.com/jfnevado/Sleep-study/blob/master/plots/smoking.png)
![cafeina](https://github.com/jfnevado/Sleep-study/blob/master/plots/caffeine.png)
![ejercicio](https://github.com/jfnevado/Sleep-study/blob/master/plots/exercise.png)
![correlacion_externa](https://github.com/jfnevado/Sleep-study/blob/master/plots/externalcorrelation.png)
![despertares](https://github.com/jfnevado/Sleep-study/blob/master/plots/awakenings_external.png)

**-Factores demográficos**

He creado gruops de edad para sacar conclusiones más relevantes, diferenciando menores de 20, de 20 a 40, de 40 a 60 y mayores de 60.

Los que más duermen son los menores de 20, que a su vez son los menos eficientes. Por el contrario tenemos a la franja entre los 40 y 60 años, que son los que menos duermen y los más eficaces.

![edad](https://github.com/jfnevado/Sleep-study/blob/master/plots/age.png)

Por género no hay ninguna diferencia.
![genero](https://github.com/jfnevado/Sleep-study/blob/master/plots/gender.png)

**-Factores temporales**

En cuanto a la importancia del día podemos ver como el lunes es el día que más se duerme, y el viernes el que menos. En cuanto a eficiencia destaca el sábado.

![día](https://github.com/jfnevado/Sleep-study/blob/master/plots/day.png)

**-Generales**

Vamos a analizar la mediana al ser mas representativa de los datos.
Eficiencia del sueño 82.0%.

Duración del sueño 7 horas y 30 minutos, siendo 1 hora y 41 minutos de sueño REM,
4 horas y 16 minutos de sueño profundo y finalmente, 1 hora y 22 minutos de sueño ligero.
 
Durante este tiempo lo normal es que se produzcan 1.0 interrupciones del sueño, pasando
1 hora y 17 minutos despiertos.

Buscando como mejorar la eficiencia de nuestro sueño, y tener el mejor descanso posible, podemos ver que la franja horaria en la que mejor se descansa es entre las 7 y 8 horas. Podemos observar como a partir de las 8 horas se produce un decrimento en la calidad del sueño, por lo que aumentar las horas de sueño no siempre tiene porque ser beneficioso. 

![eficiciencia-tiempo](https://github.com/jfnevado/Sleep-study/blob/master/plots/kdesleep.png)


## [Dashboard](https://github.com/jfnevado/Sleep-study/blob/master/dashboard/dashboard.pdf)
![dashboard](https://github.com/jfnevado/Sleep-study/blob/master/dashboard/dashboard.png)

## Paleta de color
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


#### [Archivo SQL](https://github.com/jfnevado/Sleep-study/blob/master/Sleep_querys.sql)
#### [Archivo Python](https://github.com/jfnevado/Sleep-study/blob/master/main.ipynb)