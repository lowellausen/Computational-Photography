function [output] = gammaencoding(input, gamma)
%Aplica��o do Gamma encoding

% Convers�o para que o valor de intensidade dos pixels fique entre 0 e 1
im = double(input)/(2^16);

% Aplica��o efetiva do gamma encoding, elevando o valor da intensidade de
% cada canal ao gamma de 1 sobre o valor recebido recebido
im2=(im.^(gamma))*(2^16);

% Tamb�m restaura pra valores entre 0 e 2^16 para convers�o a uint16

output = uint16(im2);
end

