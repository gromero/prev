### No R, isolado:
```
source("simula.R")
montante(25,9,100)          #  25 anos depositando R$ 100,00/mês com juros de 9% aa
montante_retirado(25,9,199) #  Ibidem, mas retirando antes do vencimento
```

### Deploy:
```
install.packages('rsconnect')
library(rsconnect)
runApp("./prev")    # Teste local
rsconnect::setAccountInfo(name="<ACCOUNT>", token="<TOKEN>", secret="<SECRET>")
deployApp("./prev") # Deploy para cloud ;-)
```

### Resultado deploy:
[prev@shinyapps.io](https://gromero.shinyapps.io/r_files/)
