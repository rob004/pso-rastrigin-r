# PSO em R — Otimização por Enxame de Partículas (Trabalho de Inteligência Artificial)

Este repositório apresenta uma implementação do algoritmo de Otimização por Enxame de Partículas (PSO) em linguagem R. O projeto foi desenvolvido como parte das atividades da disciplina de Inteligência Artificial, com foco na resolução da função Rastrigin.

## Visão Geral

A função Rastrigin é amplamente utilizada como benchmark para testar algoritmos de otimização, por ser uma função não-convexa e multimodal. O PSO, inspirado no comportamento coletivo de enxames, é uma abordagem eficiente para encontrar o mínimo global nesse tipo de problema.

## Parâmetros configuráveis

- `maxiter`: número de iterações (padrão: 100)
- `qtdeparticulas`: número de partículas no enxame (padrão: 30)
- `dimensoes`: número de dimensões da função (padrão: 10)
- `w`: coeficiente de inércia
- `C1` e `C2`: componentes cognitiva e social
- `limite_inf` e `limite_sup`: limites do espaço de busca
- `set.seed()`: define a semente para garantir reprodutibilidade

## Funcionalidades

- Cálculo da fitness com base na função Rastrigin
- Atualização dinâmica da melhor solução global e individuais
- Geração de gráficos de convergência:
  - Fitness média da população
  - Fitness do melhor indivíduo (gbest)
- Impressão da melhor solução encontrada ao final

## Como usar

1. Tenha o R instalado (RStudio é opcional, mas recomendado).
2. Execute o script `.R`.
3. Altere os parâmetros no início do código conforme desejado.
4. Visualize os gráficos e a melhor solução ao final da execução.

## Autor

Roberto de Morais Junior  
rmoraisjunior@gmail.com

---

# PSO in R — Particle Swarm Optimization (Artificial Intelligence Project)

This repository contains an implementation of the Particle Swarm Optimization (PSO) algorithm in R. The project was developed as part of an Artificial Intelligence course and focuses on solving the Rastrigin function optimization problem.

## Overview

The Rastrigin function is a standard benchmark in optimization due to its non-convex and multimodal nature. PSO, inspired by swarm intelligence, is an effective approach to locate the global minimum in such complex landscapes.

## Configurable Parameters

- `maxiter`: number of iterations (default: 100)
- `qtdeparticulas`: swarm size (default: 30)
- `dimensoes`: number of dimensions (default: 10)
- `w`: inertia weight
- `C1` and `C2`: cognitive and social components
- `limite_inf` and `limite_sup`: search space boundaries
- `set.seed()`: for reproducibility

## Features

- Fitness evaluation using the Rastrigin function
- Dynamic update of global and personal best positions
- Convergence plots:
  - Average fitness of the population
  - Best individual fitness (gbest)
- Output of the best solution found at the end

## How to Use

1. Install R (RStudio is optional but recommended).
2. Run the `.R` script.
3. Adjust parameters at the beginning of the code if needed.
4. Analyze the resulting plots and solution displayed in the console.

## Author

Roberto de Morais Junior  
rmoraisjunior@gmail.com
