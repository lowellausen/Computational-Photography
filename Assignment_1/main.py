import cv2
import rawpy
import imageio

path = 'scene_raw.CR2'
raw = rawpy.imread(path)
raw_img = raw.raw_image
#rgb = raw.postprocess()
#imageio.imsave('default.tiff', rgb)


print(raw_img[0][500])


cv2.imshow('image', raw_img)


# ficamos em laço esperando o usuário ou fechar a janela ou clicar na imagem (botão esquerdo) para adicionar um jogador
k = 0
while 1:
    k = cv2.waitKey(0)

    saida = cv2.destroyAllWindows()
    if (saida == None):
        break
