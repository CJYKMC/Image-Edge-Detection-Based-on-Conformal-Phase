
function [ Right_Rate ] = Classification( LBP_Similar,Test_Num,Train_ClassIDs,Class_Num,K)
%CLASSIFICATION �����㷨��ͼƬ�ķ���Ч��
%   �����㷨�ķ�����ȷ��
%CLASSIFICATION �����㷨��ͼƬ�ķ���Ч��
%   �����㷨�ķ�����ȷ��

% Right_Num=0;
% Wrong_Num=0;
LBP_Class_KNN=zeros(Test_Num,Class_Num);
for i=1:Test_Num
%     LBP_Mean=mean(LBP_Similar(i,:));
    for s=1:K
        %����LBP
        [Sim_min, Class]= min(LBP_Similar(i,:));
        LBP_Similar(i,Class)=999999;
%         LBP_Class_KNN(i,Train_ClassIDs(Class))=LBP_Class_KNN(i,Train_ClassIDs(Class))+LBP_Mean/Sim_min;
        LBP_Class_KNN(i,Train_ClassIDs(Class))=LBP_Class_KNN(i,Train_ClassIDs(Class))+1;
    end
end
Right_Rate=LBP_Class_KNN;
end
