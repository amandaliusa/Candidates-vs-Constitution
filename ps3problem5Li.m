%{
a. First, define the dictionary consisting of m = 10 words. 

The words I have chosen are: "consent", "duties", "vote", "power", 
"judicial", "public", "right", "enforce", "citizens", and "elect". 
%}

%{
b. Construct the Gram matrix associated with the normalized bag-of-words 
representations of n = 6 texts, and report the name of the candidate whose 
wikipedia page is most similar (with respect to your dictionary) to the 
text of the Constitution. 
%}

% representation of each document according to chosen dictionary 
x1 = [0;0;86;6;2;52;21;1;9;113]; % Bernie Sanders
x2 = [0;2;102;29;2;77;50;1;10;117]; % Hillary Clinton
x3 = [0;1;35;12;1;83;36;4;6;92]; % Donald Trump
x4 = [0;0;65;9;2;117;22;2;22;48]; % Ted Cruz
x5 = [0;0;42;9;2;117;22;2;7;60]; % John Kasich
x6 = [11;16;36;37;7;14;16;9;22;46]; % Constitution 

Z = [x1/norm(x1), x2/norm(x2), x3/norm(x3), x4/norm(x4), x5/norm(x5), ...
    x6/norm(x6)]; % matrix of normalized vectors 

G = Z'*Z % construct Gram matrix 
closest = max(G(6,1:5)); % find page most similar to Constitution

if (closest == G(6,1))
    winner = 'Sanders';
elseif (closest == G(6,2))
    winner = 'Clinton';
elseif (closest == G(6,3))
    winner = 'Trump';
elseif (closest == G(6,4))
    winner = 'Cruz';
elseif (closest == G(6,5))
    winner = 'Kasich';
end

fprintf('%s has a Wikipedia page most similar to the Constitution.\n'...
    , winner)

% The results show that Hillary Clinton's Wikipedia page is most similar
% to the text of the Constitution. 
