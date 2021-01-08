function output = gamma_expansion(img,gamma)
% Convers�o para que o valor de intensidade dos pixels fique entre 0 e 1
im = double(img)/255;

% Aplica��o efetiva do gamma expansion, elevando o valor da intensidade de
% cada canal ao gamma de 1 sobre o valor recebido recebido
im2=(im.^(1/gamma))*255;

% Tamb�m restaura pra valores entre 0 e 2^8 para convers�o a uint8
output = uint8(im2);
end

