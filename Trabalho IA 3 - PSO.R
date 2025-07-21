#-----------------------------------------------------------------------------#
#           Busca em funções complexas com Inteligência de Enxames            #

# Roberto de Morais Junior                                                    #
#                                                          #
# rmoraisjunior@gmail.com                                                     #
#-----------------------------------------------------------------------------#

#definindo os parametros do PSO
maxiter <- 100  
w <- 0.7        #inercia
C1 <- 1.5       #constante cognitiva
C2 <- 1.5       #constante social
qtdeparticulas <- 30 
dimensoes <- 10 
limite_inf <- -5.12  
limite_sup <- 5.12   
target <- rep(-1/3, dimensoes)  #valor ótimo p cada dimensão

#inicializando as particulas
set.seed(42)  #reprodutibilidade
particulas <- matrix(runif(qtdeparticulas * dimensoes, limite_inf, limite_sup), nrow=qtdeparticulas, ncol=dimensoes)
velocidades <- matrix(runif(qtdeparticulas * dimensoes, -1, 1), nrow=qtdeparticulas, ncol=dimensoes)

#fitness (Rastrigin)
fitness <- function(x) {
  10 * length(x) + sum(x^2 - 10 * cos(2 * pi * x))
}

#avaliçao inicial da fitness
evaluacoes <- apply(particulas, 1, fitness)
pbest <- particulas  #melhor posição individual
pbest_fitness <- evaluacoes
gbest <- particulas[which.min(evaluacoes), ]  #melhor posição global
gbest_fitness <- min(evaluacoes)

#vetores para armazenar historico
ftmedia <- numeric(maxiter)
ftgbest <- numeric(maxiter)

#loop principal 
for (iter in 1:maxiter) {
  for (i in 1:qtdeparticulas) {
    #calculando componentes
    inercia <- w * velocidades[i, ]
    cognitivo <- C1 * runif(dimensoes) * (pbest[i, ] - particulas[i, ])
    social <- C2 * runif(dimensoes) * (gbest - particulas[i, ])
    
    #atualizando velocidade e posicao
    velocidades[i, ] <- inercia + cognitivo + social
    particulas[i, ] <- particulas[i, ] + velocidades[i, ]
    
    #aplicando limites
    particulas[i, ] <- pmax(pmin(particulas[i, ], limite_sup), limite_inf)
    
    #avaliando nova posição
    nova_fitness <- fitness(particulas[i, ])
    
    #atualizando pbest
    if (nova_fitness < pbest_fitness[i]) {
      pbest[i, ] <- particulas[i, ]
      pbest_fitness[i] <- nova_fitness
    }
    
    #atualizando gbest
    if (nova_fitness < gbest_fitness) {
      gbest <- particulas[i, ]
      gbest_fitness <- nova_fitness
    }
  }
  
  #armazena métricas
  ftmedia[iter] <- mean(pbest_fitness)
  ftgbest[iter] <- gbest_fitness
}

    #resetando os graficos 

graphics.off()
    #graficos 
par(mfrow=c(1,2), mar=c(3,3,2,1), oma=c(1,1,1,1))
plot(ftmedia, type="l", col="blue", ylab="Fitness Média", xlab="Iteração", main="Fitness Média")
plot(ftgbest, type="l", col="red", ylab="Fitness do GBest", xlab="Iteração", main="Fitness do GBest")

    #resultado
print(paste("Melhor solução encontrada:", paste(round(gbest, 4), collapse=", ")))
print(paste("Fitness do melhor indivíduo:", round(gbest_fitness, 4)))
