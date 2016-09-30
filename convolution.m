function z=convolution(x,h)
    lx=length(x);           % lx is length of input signal
    lh=length(h);           % lh is length of filter
    z=zeros(lx+lh,1);       % defining a column vector for the output
    % Convolution
    for n=2:lh              % component values of output from '2' to 'lh'
        for k=1:n-1
            z(n,1)=z(n,1)+x(k,1)*h(1,n-k);
        end
    end
    
    for n=lh+1:lx+1         % component values of output from 'lh-1' to 'lx+1'
        for k=n-lh:n-1
            z(n,1)=z(n,1)+x(k,1)*h(1,n-k);
        end
    end

    for n=lx+2:lx+lh        % component values of output from 'lx+2' to 'lx+lh'
        for k=n-lh:lx
            z(n,1)=z(n,1)+x(k,1)*h(1,n-k);
        end
    end
end