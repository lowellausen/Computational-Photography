function [output]=demosaicing(input)
% Grandemente influenciado pelo c�digo dispon�vel em:
% https://www.mathworks.com/matlabcentral/fileexchange/5219-bilinear-interpolation

im=double(input);
    
M = size(im, 1);
N = size(im, 2);

% Extra��o dos pixels de cada cor para seus canais
red_mask = repmat([1 0; 0 0], M/2, N/2);
green_mask = repmat([0 1; 1 0], M/2, N/2);
blue_mask = repmat([0 0; 0 1], M/2, N/2);
R=im.*red_mask;
G=im.*green_mask;
B=im.*blue_mask;
    
% Interpola��o bilinear realizada pela aplica��o de filtro de m�dia:
%  0     1/4   0
%  1/4   0     1/4
%  0     1/4   0
% Para utilizar as posi��es da cor verde
kernel1 = [0 1 0; 1 0 1; 0 1 0]/4;

% e o filtro:
%  1/4   0     1/4
%  0     0     0
%  1/4   0     1/4
% Para utilizar as posi��es das outras duas cores
kernel2 = [1 0 1; 0 0 0; 1 0 1]/4;

% A imagem gerada pela fun��o imfilter tem apenas os pixels que faltam a
% imagem original, sendo necess�rio somar a imagem original para que todos
% sejam contemplados

% Aqui operamos o canal verde
G= G + imfilter(G, kernel1);

% Considerando que os canais azul e vermelhos tem menor popula��o de pixels
% � necess�rio realizar a interpola��o em etapas, primeiro preenchendo os
% localizados entre quatro vizinhos da cor de interesse e ent�o, utilizando
% tamb�m essa informa��o, completar o resto.

% Aqui operamos o canal azul.
% primeiro operando os pixels localizados nas posi��es preenchidas pela cor
% vermelha
B1 = imfilter(B,kernel2);
% E ent�o os preenchidos pela cor verde.
B2 = imfilter(B+B1,kernel1);
% Finalmente as informa��es s�o unidas para nos fornecer o resultado
B = B + B1 + B2;
    
% Aqui operamos o canal vermelho
% da mesma forma, � necess�rio primeiro preencher as posi��es referentes ao
% azul
R1 = imfilter(R,kernel2);
% ent�o as posi��es referentes ao verde
R2 = imfilter(R+R1,kernel1);
% E finalmente unificar a informa��o original com os resultados
% interpolados
R = R + R1 + R2;

im2(:,:,1)=R; im2(:,:,2)=G; im2(:,:,3)=B;
output = uint16(im2);
end
