%Q 1 & 2
s1=[1 -1 1 -1 1 -1 1 -1];
s2=[1 1 1 1 -1 -1 -1 -1];
s3=[1 1 -1 -1 1 1 -1 -1];
T1 = [0 2 2];
T2 = [-2 0 2];
T3 = [1 1 1];

T = [T1',T2',T3'];

s = [s1',s2',s3'];

snormal = normc(s)    % normalizing input vector

orthogonal = snormal'*snormal  % checking orthogonality

x = T*snormal';
y = x*snormal

savg = (snormal(:,1)+snormal(:,2))/2

r = x*savg   % answer for question-2

Tavg = (T(:,1)+T(:,2))/2

%Q 3
randomS = rand(100,3)-.5;
sn = normc(randomS);
sn'* sn

x = T*sn';
y = x*sn

randomS = rand(10000,3)-.5;
sn = normc(randomS);
sn'* sn

x = T*sn';
y = x*sn