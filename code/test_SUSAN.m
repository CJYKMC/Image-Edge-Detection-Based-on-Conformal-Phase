[filename,pathname]=uigetfile({'*.*';'*.bmp';'*.jpg';'*.tif';'*.jpg'},'ѡ��ͼ��');
if isequal(filename,0)||isequal(pathname,0)
  errordlg('����û��ѡȡͼƬ����','��ܰ��ʾ');%���û�����룬�򴴽�����Ի��� 
  return;
else
  image=[pathname,filename];
end
tic
im = imread(image);             % Read the image 
if size(im,3)==3
    im=rgb2gray(im);
end

mask55 =[0 0 1 0 0;
         0 1 1 1 0;
         1 1 0 1 1;
         0 1 1 1 0;
         0 0 1 0 0];
points = SUSAN(im);
Smax = sum(mask55(:));
pts = points((points(:,3)>Smax/4),:);%����Ե��Ӧ>Smax/4ʱ����Ϊ�ǽǵ�

pt = regionmax(im,pts,13);%ȡ�ֲ���ֵ�������ظ��ǵ�,ͼ�������ȡ7
%pt = pts;

imshow(im);hold on;%��SUSAN�ǵ������ʾ��ԭ����ͼ����
s = 2;
for i=1:size(pt,1)
    plot(pt(i,2),pt(i,1),'r.');
end