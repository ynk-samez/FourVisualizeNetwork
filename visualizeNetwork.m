function visualizeNetwork(Adj)

config;
x=1;y=2;
    %ノードの基本座標生成
xt=2*pi/3;%size(Adj,x);
theta=pi/2;
for k=1:3%size(Adj,x)
    P(k,:)=[cos(theta),sin(theta)];
    theta=theta+xt;
end
P(4,:)=[0,0];

for i=1:size(Adj,y)
    for k=1:size(Adj,x)
        if i==k
            sAdj(i,k)=0;
        else 
            sAdj(i,k)=1;
        end
    end
end

k=1;
for i=1:numel(Adj)
    if sAdj(i)==1
    Widths(k)=round(Adj(i),ROUND);
        k=k+1;
    end
end

G = digraph(sAdj);

G.Edges.Weight=(Widths.*Widths)';
G.Edges.Weight=8*G.Edges.Weight/max(G.Edges.Weight);
figure(1)
    h=plot(G,"XData",P(:,x),"YData",P(:,y),"LineWidth",G.Edges.Weight,"EdgeCData",Widths','EdgeLabel',Widths',"MarkerSize",NODE_SIZE,"NodeColor",NODE_COLOR);
      ax = gca;
    ax.XTickLabel = cell(size(ax.XTickLabel));
    ax.YTickLabel = cell(size(ax.YTickLabel));
    h.NodeFontSize = NODE_LABEL_SIZE;
    h.NodeFontName = NODE_LABEL_FONT;
    h.NodeLabelColor=NODE_LABEL_COLOR;
    h.NodeFontAngle='normal';
    h.ArrowSize=ARROW_SIZE;
    h.EdgeFontName=EDGE_LABEL_FONT;
    h.EdgeLabelColor=EDGE_LABEL_COLOR;
    h.EdgeFontSize=EDGE_LABEL_SIZE;
    h.NodeLabel;
    labelnode(h,INDEX,NODE_NAMES);
    
    colorbar;
    colormap(COLORMAP);
    h
end