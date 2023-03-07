# Análisis del sueño

## Author
[@jfnevado](https://github.com/jfnevado)

## Descripción

There are rumors that alpha calls for the High and QC tokens were being given in a community. Both tokens belong to similar projects (metaverse gamefi) and have had a similar performance in recent days, contrary to the general market movement. These are more than enough reasons to conduct an investigation and determine if the rumors are true. 

Additionally, GQ is a token that I have been wanting to investigate more deeply. After 1 year with the project and the vesting about to end, it was the perfect time to check the status of it and study the patterns of its holders.

![price-gq](https://github.com/jfnevado/Outer-ring/blob/master/plots/gq-busd.png)
![price-high](https://github.com/jfnevado/Outer-ring/blob/master/plots/high-busd.png)

Note: There is one file for each branch of the analysis to enhance readability and make it more accessible for future investigations.

## Steps
- Data retrieval through APIs
  - BSC Api
  - CoinGecko
- Data cleaning
- Data transformation
- Data visualization

## Comparative Conclusion

Hipothesis: there are alpha groups doing calls of both tokens, making them perform quite close.

![price-comparative](https://github.com/jfnevado/Outer-ring/blob/master/plots/comparative-price.png)

Results: only 2.12% of the wallets bought both tokens.

| Token | Wallets |
|-------|---------|
| GQ    | 987     |
| HIGH  | 1507    |
| Ambos | 53      |

We can conclude this was pure coincidence, these tokens perform besides being opposite to the whole market performance has nothing in coomon. 

## Analysis Conclusion
### Points
- Balance and transactions
- Day activity
- Group distribution
- Seed investors

### [Balance and transactions](../master/price-balance-count.ipynb)

With the balance flow, we want to see the relationship between people selling tokens and buying them. And we can observe that at the launch of the token, besides the pump of the token, the inflow was low relative to the token vesting sellers. As a result, it managed to pump due to the low volume of tokens in circulation.

![price-comparative](https://github.com/jfnevado/Outer-ring/blob/master/plots/comparative-price-balance-tx.png)

### [Day activity](../master/day_of_week.ipynb)

The activity is quite similar during the whole week but we can see a big positive flow during the sundays.

![price-comparative](https://github.com/jfnevado/Outer-ring/blob/master/plots/tx-by-days-names.png)
![price-comparative](https://github.com/jfnevado/Outer-ring/blob/master/plots/tx-balance-by-days-names.png)

### [Group distribution](../master/whales.ipynb)

We can see that the majority of the tokens are in the staking, and the pressure from ventures/investors will end soon

![price-comparative](https://github.com/jfnevado/Outer-ring/blob/master/plots/wallet-type-balance.png)

![price-comparative](https://github.com/jfnevado/Outer-ring/blob/master/plots/wallet-type-send-recibe-tx.png)

### [Seed investors](../master/seed-hold.ipynb)

Traking ventures dispensers and claims contract we can observe that only 17.97% of the seed investers sold their tokens, 3.84% of them are steaked and 7.91% even bought more.

## Conclusion

During this whole year all proyects estrugled but GQ holders keep trusting it and acumulating, the great performance of the stake speak itself. The sidelining phase ended and with the recent news it's starting to get traction again.

Nothing extrange had been discover and we can assure Galactiq Quadrant token is quite healthy. 

## Run Locally
Initialize git

```bash
git init
```


Clone the project

```bash
git clone https://github.com/jfnevado/Outer-ring
```

enter the project directory

```bash
cd Outer-ring
```

Create a python virtual environment 

```bash
python -m venv <env_name>
```

Activate the conda environment

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
