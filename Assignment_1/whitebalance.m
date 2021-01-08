function [output]=whitebalance(input, whitevalue)
% Recebe uma imagem uint18 e um valor de branco em % de cada canal
% Retorna uma imagem com o balanço de cores tomando o valor recebido como
% referência

R=input(:,:,1).*(100/whitevalue(1));
G=input(:,:,2).*(100/whitevalue(2));
B=input(:,:,3).*(100/whitevalue(3));

 output(:,:,1)=R; output(:,:,2)=G; output(:,:,3)=B;
end