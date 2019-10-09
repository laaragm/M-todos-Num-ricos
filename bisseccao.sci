//Ana Luiza Ballarini e Lara Galvani

clear //limpa todas as variáveis

//declaração da função
function[y]= f(x) 
    y = 4*cos(x)-2.71828182846^x;
endfunction

a = 0;
b = 2;
tolerancia = 10^(-3);
Fa = f(a); //calcula o valor de Fa no ponto a
Fb = f(b); //calcula o valor de Fb no ponto b
iteracoes = 0;
deltaX = tolerancia + 1; //esse valor é só pra inicializar 
x = a; //isso tanto faz, é só para inicializar um valor

mprintf('f(x) = 4*cos(x)-e^x em [0,2], com erro menor ou igual a %.3f\n', tolerancia);

while 1
    xAnterior = x;
    x = (a+b)/2;
    Fx = f(x);
    //exibe o número de iterações, a, f(a), b, f(b), x, f(x) e deltaX
    //disp(iteracoes, a, Fa, b, Fb, x, Fx, deltaX); mprintf('\n');
    //sai do loop quando deltaX for menor ou igual a tolerancia
    if(tolerancia >= deltaX) then 
        break;
    end
    //A partir de f(x) verificamos qual tem sinal oposto (f(a) ou f(b)). 
    //Mantemos o que tem sinal oposto e colocamos x e f(x) no lugar do que tem o mesmo sinal de f(x)
    if(Fa*Fx > 0) then
        a = x;
        Fa = Fx;
    else
        b = x;
        Fb = Fx;
    end
    deltaX = abs(x-xAnterior); //atualiza o valor do delta
    iteracoes = iteracoes + 1;
end

mprintf('Raiz = %f', x); //exibe a raiz

