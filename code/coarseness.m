function [ ent ] = coarseness( Image )
%A �˴���ʾ����ժҪ
%   �˴���ʾ��ϸ˵��
% [row,col]=size(Image);
% k=4;
% edge_len=2^k;
% F=zeros(1,5);
% for x=1+edge_len:row-edge_len
%     for y=1+edge_len:col-edge_len
%         for n=1:k
%             Eh(n)=abs(A(Image,x+2^(n-1),y,n)-A(Image,x-2^(n-1),y,n));
%             Ev(n)=abs(A(Image,x,y+2^(n-1),n)-A(Image,x,y-2^(n-1),n));
%         end
%         [hval,hnum]=max(Eh(:));
%         [vval,vnum]=max(Ev(:));
%         if hval>vval
%             F(hnum)=F(hnum)+1;
%         else
%             F(vnum)=F(vnum)+1;
%         end
%     end
% end
% F=F/sum(F);
% FV=0;
% for j=1:k
%     FV=FV+F(j)*2^j;
% end
% Pic_F=F;
% Pic_FV=FV;
% end
[h w]=size(Image);
ks=4;
h1=h-ks;
w1=w-ks;
 
%%��ƽ��ǿ��
picmean=zeros(h1,w1,ks);
picmean(:,:,1)=Image(1:h1,1:w1);
for k=1:ks-1
    for i=1:h1
        for j=1:w1
            picwindow=Image(i:i+k,j:j+k);
            picmean(i,j,k+1)=mean2(picwindow);
        end
    end
end
%%���������򴰿ڲ��ص�������ֵ
h2=h1-ks;
w2=w1-ks;
picmax3=zeros(h2,w2,ks);
for k=1:ks
    pic_h_deference=picmean(1+k:h2+k,1:w2,k);    %ˮƽ����
    pic_v_deference=picmean(1:h2,1+k:w2+k,k);    %��ֱ����
    pic_d_deference=picmean(1+k:h2+k,1+k:w2+k,k);    %�ԽǷ���
   
    pic_h_deference=abs(pic_h_deference-picmean(1:h2,1:w2,k));
    pic_v_deference=abs(pic_v_deference-picmean(1:h2,1:w2,k));
    pic_d_deference=abs(pic_d_deference-picmean(1:h2,1:w2,k));
    picmax3(:,:,k)=max(max(pic_h_deference,pic_v_deference),pic_d_deference);
end
[picmax2,maxk]=max(picmax3,[],3);     % ȷ������ֵ��λ��
 
ent=mean2(2.^maxk);












