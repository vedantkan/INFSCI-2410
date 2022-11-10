% % Question-1
% p8.smat=eye(8)
% p8.tmat=eye(8)
% i8=eye(8);p8.tmat=i8+i8([2 3 4 5 6 7 8 1],:)+i8([8 1 2 3 4 5 6 7],:);
% [p8.smat,p8.tmat]
% p8net0=initnet3(8,2,8,2,2)
% act0=forw3(p8net0,p8)
% act0.stim
% act0.hid
% act0.out
% 
% net20k=bp3(p8net0,p8,20000,.5,0)
% ac20k=forw3(net20k,p8)
% ac20k.out
% n0=initnet3(8,2,8,4,4)
% nf=bp3(n0,p8,20000,.02,0)
% act10k=forw3(nf,p8)
% act10k.out
% nf=bp3(n0,p8,20000,.05,0)
% act10k=forw3(nf,p8)
% act10k.out

% % Question-2
% p83n0=initnet3(8,2,8,4,4)
% p83nf=bp3(p83n0,p8,20000,.05,0)
% act10k=forw3(p83nf,p8)
% p83act10k=act10k
% act10k.out

% Question-3
p12.smat=eye(12)
p12.tmat=eye(12)
p12
p12net0=initnet3(12,3,12,4,4)
p12act0=forw3(p12net0,p12)
p12act0.stim;
p12act0.out;
p12act0.hid
p12net20k=bp3(p12net0,p12,20000,.2,0)
p12act20k=forw3(p12net20k,p12)
p12act20k.out
p12.tmat

function netstruct=initnet3(n1,n2,n3,uamp,vamp)
netstruct.wih=uamp*(rand(n2,n1)-0.5) ;
netstruct.hbias=uamp*(rand(1,n2)-0.5) ;
netstruct.whout=vamp*(rand(n3,n2)-0.5) ;
netstruct.obias=vamp*(rand(1,n3)-0.5);
end

function netact=forw3(netwk,pats)
netact.stim=pats.input;
netact.hid=layersigpn(netact.stim,netwk.wih,netwk.hbias) ;
netact.out=layersig01(netact.hid,netwk.whout,netwk.obias) ;
end