function [c,f] = MohrCircleFittingFun(sigmal1,sigmal3)
%MOHRCIRCLEFITTINGFUN calculate the C and �� of the mohr circle.
%  ǿ�Ȳ���
% sigmal1
% sigmal3

% ����Բ�ĺͰ뾶
C=[(sigmal3+sigmal1)/2,zeros(length(sigmal1),1)];
R=abs(sigmal3-sigmal1)/2;

% ��С���˷����
dist=@(t,C)abs(C(:,3)-abs(t(1).*C(:,1)-C(:,2)+t(2))./sqrt(1+t(1).^2));
options = optimoptions('lsqcurvefit','Display','off');
[X,~]=lsqcurvefit(dist,[0.1,0],[C,R],zeros(size(C,1),1));

c=X(2);
f=atan(X(1))/pi*180;
end

