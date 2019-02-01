%M1
%vetor linha
u = [1 2 3]
%vetor coluna
v = [1;2;3]
%vetor linha com numeros naturais menores que 10
w = 1:10
%vetor linha com numeros pares naturais menores que 12
t = 2:2:12
%matriz
A = [2 2 3; 4 5 6; 7 8 9]

%M2
%Matriz com a interceção das colunas 1 e 2, e as linhas 2 e 3
B = A(2:3,1:2)
%Matriz com as duas primeiras colunas
C = A(:,1:2)
%Acrescenta a linha 4 4 4 à matriz A
D = [A; 4 4 4]
%Matriz com as linhas 2 e 4 de D
E = D([2 4],:)
%Contrução de uma matriz
F = [0:3:9;2:2:8;5:5:20]
%Duplicar os elementos da interceção da linha 1 e 2 pela coluna 1
A([1 2])=2*A([1 2],1)
%Trocar os elementos da primeira linha pela terceira na primeira coluna
A([1 3],1)=A([3,1],1)

%M1.3
%Matriz identidade
I = eye(5)
%Matriz aleatoria
Al = rand(3)
%Matriz aleaotoria de -1 a 1
R1 = rand(4,3)
R2 = rand(4,3)
R = R1 - R2
%Matriz nula
N = zeros(2,3)
%Matriz de 1s
U = ones(2)
%Todos os elementos a 10
T = 10 * ones(10)
%Diagonal igual a A e resto 0
d = diag(A)
D = diag(d)

%M1.4
A2 = [1 3 5; 0 4 1; 2 2 1]
B2 = ones(3)
a = [1 2 1]
b = [0 3 5]

%A+B
A2+B2
%produto de cada elemento de a por b
%operações entre vetores ./ .* .^
a.*b
%A x B
A2 * B2
%produto de cada elemento de A por B
A2 .* B2

%M1.5
[soma, produto] = soma_produto (1,2)
function[s,p] = soma_produto(x,y)
    s = x+y;
    p = x*y;
end

%M1.6
[soma2, produto2] = soma_produto2 ([1 2 3 4])
function[s,p] = soma_produto2(v)
    s = sum(v);
    p = prod(v);
end

%M1.7
maior = maior_seq ([1 2 3 4])
function[m] = maior_seq(v)
    m = max(v);
end