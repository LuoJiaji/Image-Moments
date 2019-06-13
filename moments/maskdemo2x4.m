
% N = [2,4,4,4,5,5,5,5];
% M = [2,0,2,4,1,2,3,5];

N = [1,3,3,4,4,5,5,6];
M = [1,1,3,2,4,3,5,6];
% N = [1];
% M = [1];

% figure(1)
width=1200;%宽度，像素数
height=600;%高度
left=0;%距屏幕左下角水平距离
bottem=0;%距屏幕左下角垂直距离
% figure(1)
set(gcf,'position',[left,bottem,width,height])


colormap(parula)
for i = 1:length(N)
    subplot(2,4,i)
    
%     mask = Zerinke(400,N(i),M(i));
%     mask = PCET(400,N(i),M(i));
%     mask = PCT(400,N(i),M(i));
%     mask = PST(400,N(i),M(i));

    mask =GPCET(400, N(i), N(i), 3);
    
    mesh(real(mask))
    view(0,90)

    str = strcat('M^',num2str(N(i)),'_',num2str(M(i)));
    title(str,'FontSize',20)

%     title(str,'fontname','Times New Roman','FontSize',10);
    axis off
end

