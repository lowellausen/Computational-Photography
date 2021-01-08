import cv2
import rawpy
import numpy as np

path = 'converted.dng'
raw = rawpy.imread(path)
raw_img = raw.raw_image_visible
#rgb = raw.postprocess()
#imageio.imsave('default.tiff', rgb)


height = raw_img.shape[0]
width = raw_img.shape[1]

uint8_rawimg = np.zeros((height, width, 1), np.uint8)

#blank_image[:,0:width//2] = (255,0,0)      # (B, G, R)
#blank_image[:,width//2:width] = (0,255,0)

minimg = raw_img.min()
maximg = raw_img.max()
rangeimg = maximg - minimg

for i in range(height):
    print(i)
    for j in range(width):
        uint8_rawimg[i, j] = ((raw_img[i, j] - minimg) * 255) / rangeimg

cv2.imshow('image', uint8_rawimg)

print(uint8_rawimg[0, 0])
print(uint8_rawimg[15, 10])
print(uint8_rawimg[1, 0])

# -1 on dimensions size for border control
colorimg = np.zeros((height, width, 3), np.uint8)
raw_colors = raw.raw_colors_visible
for i in range(1, height - 1):
    for j in range(1, width - 1):
        mask_value = raw_colors[i, j]
        if mask_value == 1:  # upper G case
            r = 0.5 * (uint8_rawimg[i, j + 1][0] + uint8_rawimg[i, j - 1][0]) # - pattern
            g = uint8_rawimg[i, j][0]
            b = 0.5 * (uint8_rawimg[i + 1, j][0] + uint8_rawimg[i - 1, j][0]) # I pattern
            colorimg[i, j] = (b, g, r)
        elif mask_value == 3:  # lower G case
            r = 0.5 * (uint8_rawimg[i + 1, j][0] + uint8_rawimg[i - 1, j][0]) # I pattern
            g = uint8_rawimg[i, j][0]
            b = 0.5 * (uint8_rawimg[i, j + 1][0] + uint8_rawimg[i, j - 1][0]) # - pattern
            colorimg[i, j] = (b, g, r)
        elif mask_value == 0: # red case
            r = uint8_rawimg[i, j][0]
            g = 0.25 * (uint8_rawimg[i, j - 1][0] + uint8_rawimg[i - 1, j][0] + uint8_rawimg[i, j + 1][0] + uint8_rawimg[i + 1, j][0])  # + pattern
            b = 0.25 * (uint8_rawimg[i - 1, j - 1][0] + uint8_rawimg[i - 1, j + 1][0] + uint8_rawimg[i + 1, j + 1][0] + uint8_rawimg[i + 1, j - 1][0]) # X pattern
            colorimg[i, j] = (b, g, r)
        elif mask_value == 2: # blue case
            r = 0.25 * (uint8_rawimg[i - 1, j - 1][0] + uint8_rawimg[i - 1, j + 1][0] + uint8_rawimg[i + 1, j + 1][0] + uint8_rawimg[i + 1, j - 1][0]) # X pattern
            g = 0.25 * (uint8_rawimg[i, j - 1][0] + uint8_rawimg[i - 1, j][0] + uint8_rawimg[i, j + 1][0] + uint8_rawimg[i + 1, j][0])  # + pattern
            b = uint8_rawimg[i, j][0]
            colorimg[i, j] = (b, g, r)
        else:
            print('tf??')
    print(i)


cv2.imshow('color img', colorimg)



# ficamos em laço esperando o usuário ou fechar a janela ou clicar na imagem (botão esquerdo) para adicionar um jogador
k = 0
while 1:
    k = cv2.waitKey(0)

    saida = cv2.destroyAllWindows()
    if (saida == None):
        break
