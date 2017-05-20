simula <- function (nr_anos, juros_aa, contribuicao_am) {
  # 1 + aa = (1 + am)^12
  juros_am = (1 + juros_aa/100)^(1/12) - 1

# cat(round(montante(5, juros_am, contribuicao_am), 2), " ", round(montante_retirado(5, juros_am, contribuicao_am), 2), "\n")
  m1 <- round(montante         (5, juros_am, contribuicao_am), 2)
  m2 <- round(montante_retirado(5, juros_am, contribuicao_am), 2)

  output <- matrix(c(m1,m2), ncol=2)

  for (i in 1:nr_anos) {
#   cat(round(montante(5+i*12, juros_am, contribuicao_am), 2), " ", round(montante_retirado(5+i*12, juros_am, contribuicao_am), 2), "\n")
    m1 <- round(montante         (5+i*12, juros_am, contribuicao_am), 2)
    m2 <- round(montante_retirado(5+i*12, juros_am, contribuicao_am), 2)
    output <- rbind(output,matrix(c(m1,m2), ncol=2))
  }

  output <- as.data.frame(output)
  colnames(output) <- c("Saldo","Saldo Retirado")
  output
}

montante <- function (nr_mes, juros_mes, valor_inicial) {
  if (nr_mes == 1) {
    valor_inicial * (1+juros_mes)
  } else
    (valor_inicial * (1+juros_mes)^nr_mes) + montante(nr_mes-1, juros_mes, valor_inicial)
}

montante_retirado <- function (nr_mes, juros_mes, valor_inicial) {
  if (nr_mes == 1) {
    sub_total = valor_inicial*(1+juros_mes)^1
    ganho = sub_total - valor_inicial
    ganho = ganho*(1-35/100)
    total = valor_inicial + ganho
#   cat(total,"\n")
    total

  } else {
    sub_total = valor_inicial * (1+juros_mes)^nr_mes
    ganho = sub_total - valor_inicial

    if (nr_mes <= 2*12) {         # até 2 anos
      ganho = ganho*(1-35/100)
    } else if (nr_mes <= 4*12) {  # de 2 até 4 anos
      ganho = ganho*(1-30/100)
    } else if (nr_mes <= 6*12) {  # de 4 até 6 anos
      ganho = ganho*(1-25/100)
    } else if (nr_mes <= 8*12) {  # de 6 até 8 anos
      ganho = ganho*(1-20/100)
    } else if (nr_mes <= 10*12) { # de 8 a 10 anos
      ganho = ganho*(1-15/100)
    } else {                      # acima de 10 anos
      ganho = ganho*(1-10/100)
    }

    total = valor_inicial + ganho + montante_retirado(nr_mes-1, juros_mes, valor_inicial)
#   cat(total,"\n")
    total
  }
}
