function [output] = gammaencoding(input, gamma)
%Aplicação do Gamma encoding

% Conversão para que o valor de intensidade dos pixels fique entre 0 e 1
im = double(input)/(2^16);

% Aplicação efetiva do gamma encoding, elevando o valor da intensidade de
% cada canal ao gamma de 1 sobre o valor recebido recebido
im2=(im.^(gamma))*(2^16);

% Também restaura pra valores entre 0 e 2^16 para conversão a uint16

output = uint16(im2);
end

