clear all;
clc;
[filename,pathname]=uigetfile({'*.*';'*.bmp';'*.jpg';'*.tif';'*.jpg'},'ѡ��ͼ��');
if isequal(filename,0)||isequal(pathname,0)
  errordlg('����û��ѡȡͼƬ����','��ܰ��ʾ');%���û�����룬�򴴽�����Ի��� 
  return;
else
  image=[pathname,filename];
end
im = imread(image);             % Read the image 
if size(im,3)==3
    im=rgb2gray(im);
end
curvature=cms2(im);
figure;imshow(curvature,[]);

