function [Pre_Labels,Outputs] = EMLC(train_data,train_target,test_data,m,model)
%EMLC �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��


Outputs = zeros(size(train_target,1),size(test_data,1));
if any(isequal(model,@rCC))
    for i = 1:m
        [Temp_Labels,~] = model(train_data,train_target,test_data,10);
        Outputs = Outputs + Temp_Labels;
    end
else
    for i = 1:m
        [Temp_Labels,~] = model(train_data,train_target,test_data);
        Outputs = Outputs + Temp_Labels;
    end
end

Outputs = Outputs ./ m;
Pre_Labels = round(Outputs);

end

