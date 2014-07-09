function rgbtohsi(x)
x='C:\Temp_Data\satiliktarlapunjab.jpg';
F=imread(x);
F=im2double(F);
r=F(:,:,1);
g=F(:,:,2);
b=F(:,:,3);
th=acos((0.5*((r-g)+(r-b)))./((sqrt((r-g).^2+(r-b).*(g-b)))+eps));
H=th;
H(b>g)=2*pi-H(b>g);
H=H/(2*pi);
S=1-3.*(min(min(r,g),b))./(r+g+b+eps);
I=(0.2126*r)+(0.7152*g)+(0.0722*b);
hsi=cat(3,H,S,I);
HE=H*2*pi;
HE=histeq(HE);
HE=HE/(2*pi);
SE=histeq(S);
IE=histeq(I);
choice=input('1:RGB den HSI ye donusum \n2:H, S, I degelerinin tumunu goster\n3:HSI den RGB ye donusum\n4:Hue Esitleme\n5:Saturasyon Esitleme\n6:Intensity Esitleme\n7:HSI Esitleme\n Lutfen secim yapin :');
switch choice
    case 1
        figure,imshow(F),title('RGB Goruntusu');
        figure, imshow(hsi),title('HSI Goruntusu');
    case 2
        figure,imshow(F),title('RGB Goruntusu');
        figure, imshow(H),title('Hue Goruntusu');
        figure, imshow(S),title('Saturation Goruntusu');
        figure, imshow(I),title('Intensity Goruntusu');   
    case 3
        C=hsitorgb(hsi);
        figure,imshow(hsi),title('HSI Goruntusu');
        figure, imshow(C),title('RGB Goruntusu');
    case 4
        RV=cat(3,HE,S,I);
        C=hsitorgb(RV);
        figure,imshow(hsi),title('HSI Goruntusu');
        figure,imshow(F),title('RGB Goruntusu');
        figure, imshow(C),title('RGB Goruntusu-Hue Esitleme');
    case 5
        RV=cat(3,H,SE,I);
        C=hsitorgb(RV);
        figure,imshow(hsi),title('HSI Goruntusu');
        figure,imshow(F),title('RGB Goruntusu');
        figure, imshow(C),title('RGB Goruntusu-Saturation Esitleme');
    case 6
        RV=cat(3,H,S,IE);
        C=hsitorgb(RV);
        figure,imshow(hsi),title('HSI Goruntusu');
        figure,imshow(F),title('RGB Goruntusu');
        figure, imshow(C),title('RGB Goruntusu-Intensity Esitleme');
    case 7
        RV=cat(3,HE,SE,IE);
        C=hsitorgb(RV);
        figure,imshow(hsi),title('HSI Goruntusu');
        figure,imshow(F),title('RGB Goruntusu');
        figure, imshow(C),title('RGB Goruntusu-HSI Equalized');
    otherwise
        display('Yanlis Secim');
end
end
