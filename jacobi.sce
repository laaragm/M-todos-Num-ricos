//Lara Galvani Moura e Ana Luiza Ballarini Rosa

//Método de Jacobi (para matrizes 3x3)
//Objetivo: Resolver sistemas lineares da forma ax = b

clear
clc

//Parâmetros de entrada: a[], b[]
//Parâmetros de saída: x[], erro

//Passos:
//1- Teste de convergência
//2- Solução inicial
//3- Equações de iteração
//4- Encontrar as soluções do sistema, parando quando atingir a convergência

a = zeros(3,3); //cria uma matriz 'a' 3x3 e coloca 0 em cada uma das posições
b =[]; //vetor dos termos independentes

//Pede pro usuário digitar os elementos da matriz 'a'
mprintf('Coeficientes da matriz A: (Ex: a11, a12, a13, a21...)');
mprintf('\nOBS: Os elementos serão inseridos um por vez.');
for linha = 1:3 //percorre as linhas da matriz
    for coluna = 1:3 //percorre as colunas da matriz
        a(linha, coluna) = input("Insira o elemento: ");
    end
end
disp(a); //exibe a matriz a
mprintf('\n');
   
//teste de convergência - o pivô da linha tem que ser maior que a soma do módulo dos demais elementos da linha
testeConvergencia = 3;
if abs(a(1,1)) > abs(a(1,2)) + abs(a(1,3)) then
    testeConvergencia = testeConvergencia - 1;
end
if abs(a(2,2)) > abs(a(2,1)) + abs(a(2,3)) then
    testeConvergencia = testeConvergencia - 1;
end
if abs(a(3,3)) > abs(a(3,1)) + abs(a(3,2)) then
    testeConvergencia = testeConvergencia - 1;
end
if testeConvergencia == 0 then
    mprintf('A matriz converge.\n');
else
    mprintf('A matriz não converge.\n');
    return;
end
    
mprintf('\nVetor dos termos independentes (b): ');
for i = 1:3
    b(i) = input("Insira o elemento: ");
end
disp(b); //exibe b
mprintf('\n');

x = [b(1)/a(1,1), b(2)/a(2,2), b(3)/a(3,3)]; //solução inicial conforme fórmula - pega o elemento de b e divide pelo pivô da linha em questão
mprintf('Iteração: 0\n');
mprintf('Solução inicial de x1, x2 e x3, respectivamente: ');
disp(x);
mprintf('\n');

iter = 1;
anterior = []; //vetor para armazenar o elemento na posição linha (anterior que será usado para calcular a iteração k+1)
auxErro = []; //armazena os erros anteriores para calcular o delta da iteração k+1

erroDesejado = input("Entre com o erro desejado (Ex: 0.001 ou 10^(-3)): ");
erro = 1 + erroDesejado; //só para inicializar a variável erro

while erro > erroDesejado //enquando não alcançarmos o erro desejado
    
    mprintf('\nIteração: %i', iter);
    iter = iter + 1;
    
    for linha = 1:3
        soma = 0;
        anterior(linha) = x(linha);
        for coluna = 1:3
            if linha ~= coluna then
                soma = soma + a(linha, coluna) * x(coluna); //adiciona à variável soma o elemento na posição linha, coluna atual vezes a variável da coluna em questão
            end
        end
        soma = b(linha) - soma; //termo independente da linha em questão menos soma calculada no for anterior
        x(linha) = (1/a(linha,linha)) * soma;   //fórmula iteração x(k+1) -> fazemos isso uma vez pra cada linha (pois temos 3 variáveis: x1, x2 e x3)
    end
    for aux = 1:3
        auxErro(aux) = abs((x(aux))-(anterior(aux))); //coloca no vetor auxErro x(k+1) - x(k)
    end
    erro = max(auxErro)/max(x); //calcula o delta da iteração atual -> max(x(k+1) - x(k))/max(x(k+1)) 
    disp(x); //exibe x1, x2 e x3
    mprintf('Erro: %f', erro); //exibe o erro
end

//assim que sair do while anterior temos a solução do sistema
mprintf('\n\nSolução do sistema linear:');
mprintf('\nErro: %f', erro);
mprintf('\nOs valores de x1, x2 e x3 são, respectivamente: ');
disp(x); 
