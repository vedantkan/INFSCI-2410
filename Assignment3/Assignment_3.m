pn = [[1 1 -1 -1 -1 -1 -1 1]
        [-1 1 1 1 -1 -1 1 -1]
        [-1 -1 1 1 1 -1 -1 -1]
        [1 -1 -1 1 -1 1 -1 1]];
    
ncw = [[0.0  1.0  1.0  0.0  1.0  0.0  0.0  0.0 -1.5  0.0 -1.5  0.0  0.0  0.0  0.0  0.0]
        [ 1.0  0.0  0.0  1.0  0.0  1.0  0.0  0.0  0.0 -1.5  0.0 -1.5  0.0  0.0  0.0  0.0]
        [ 1.0  0.0  0.0  1.0  0.0  0.0  1.0  0.0 -1.5  0.0 -1.5  0.0  0.0  0.0  0.0  0.0]
        [ 0.0  1.0  1.0  0.0  0.0  0.0  0.0  1.0  0.0 -1.5  0.0 -1.5  0.0  0.0  0.0  0.0]
        [ 1.0  0.0  0.0  0.0  0.0  1.0  1.0  0.0  0.0  0.0  0.0  0.0 -1.5  0.0 -1.5  0.0]
        [ 0.0  1.0  0.0  0.0  1.0  0.0  0.0  1.0  0.0  0.0  0.0  0.0  0.0 -1.5  0.0 -1.5]
        [ 0.0  0.0  1.0  0.0  1.0  0.0  0.0  1.0  0.0  0.0  0.0  0.0 -1.5  0.0 -1.5  0.0]
        [ 0.0  0.0  0.0  1.0  0.0  1.0  1.0  0.0  0.0  0.0  0.0  0.0  0.0 -1.5  0.0 -1.5]
        [-1.5  0.0 -1.5  0.0  0.0  0.0  0.0  0.0  0.0  1.0  1.0  0.0  1.0  0.0  0.0  0.0]
        [ 0.0 -1.5  0.0 -1.5  0.0  0.0  0.0  0.0  1.0  0.0  0.0  1.0  0.0  1.0  0.0  0.0]
        [-1.5  0.0 -1.5  0.0  0.0  0.0  0.0  0.0  1.0  0.0  0.0  1.0  0.0  0.0  1.0  0.0]
        [ 0.0 -1.5  0.0 -1.5  0.0  0.0  0.0  0.0  0.0  1.0  1.0  0.0  0.0  0.0  0.0  1.0]
        [ 0.0  0.0  0.0  0.0 -1.5  0.0 -1.5  0.0  1.0  0.0  0.0  0.0  0.0  1.0  1.0  0.0]
        [ 0.0  0.0  0.0  0.0  0.0 -1.5  0.0 -1.5  0.0  1.0  0.0  0.0  1.0  0.0  0.0  1.0]
        [ 0.0  0.0  0.0  0.0 -1.5  0.0 -1.5  0.0  0.0  0.0  1.0  0.0  1.0  0.0  0.0  1.0]
        [ 0.0  0.0  0.0  0.0  0.0 -1.5  0.0 -1.5  0.0  0.0  0.0  1.0  0.0  1.0  1.0  0.0]];
    

w = memstor(pn);

g = goodness(w);

hopiter = hopupdate(w,pn,100);

figure
boxplot(g);
hold on;

figure
histogram(g);
hold on;

function mem = memstor(pats)
[np, nd] = size(pats);
mem = zeros(nd);
for i=1:nd
    for j=1:nd
        if(i~=j)
            for k=1:np
                mem(i,j) = mem(i,j) + pats(k,i)*pats(k,j);
            end
        end
    end
end
end


function gvals = goodness( hopnet )
%calculates goodness for all patterns in a Hopfield Network
gvals=[];
pmat=[] ;
netsize=size(hopnet,1) ;
for k=0:(2^netsize-1) 
    pvec=2*de2bi(k,netsize)-1 ;
    %pvec=pvec([end:-1:1]) ;
    pmat=[pmat;pvec];
    g=0;
    for i=1:(netsize-1)
        for j=(i+1):netsize
            g=g+hopnet(i,j)*pvec(i)*pvec(j) ;
        end
    end
    gvals=[gvals, g] ;
    
end
gvals=gvals';
[pmat,gvals];
end

function newact = hopupdate( hmat,oldact,niter)
% hopfield updates for a fixed number of iterations
% (not the traditional stopping criterion)
newact=oldact ;
for ii=1:niter
    rrownum=randi(size(hmat,1),1) ;
    if (hmat(rrownum,:)*newact'>0) 
        newact(rrownum)=1 ;
    else
        newact(rrownum)=-1 ;
    end
end
end
