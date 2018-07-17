function [EFT,EST,EFT_min] = HEFT( C,W,P,NodeNames,RankingType )

[N,~]=size(C); %Getting the Number of Nodes.

% Drawing the DAG 
 bg=biograph(C,NodeNames);
 set(bg.nodes,'shape','circle','color',[1,1,1],'lineColor',[0,0,0]);
 set(bg,'layoutType','radial');
 bg.showWeights='on';
 set(bg.nodes,'textColor',[0,0,0],'lineWidth',2,'fontsize',9);
 set(bg,'arrowSize',12,'edgeFontSize',9);
 get(bg.nodes,'position')
 view(bg);
 
 %Calculating the Averange weight on each node.
 for i=1:1:N
     W_ave(i)=sum(W(i,:))/P;
 end
 W_ave=W_ave';
 
 switch RankingType
     case 1
      [RankU,Priority] = Upward_Ranking(C,W_ave);
     case 2
      [RankD,Priority] = Downward_Ranking(C,W_ave);
     case 3
      [RankL,Priority] = Level_Ranking(C);
 end
 
 
  %Initializing the data for the first node!
 for i=1:1:P
    EST(Priority(1),i)=0;
    EFT(Priority(1),i)=EST(Priority(1),i)+W(Priority(1),i);
    process(i).member=[];
 end
    EFT_min(Priority(1))=min(EFT(Priority(1),:));
    index=find(min(EFT(Priority(1),:))==EFT(Priority(1),:));

    now = zeros(1,P); % Initializing now with 0s 
    now(index)=Priority(1);% Last task which the processor is currectly working on.
    node_inprocess(Priority(1))=index;
    process(index).member=[process(index).member,now(index)];
    
    
    %A loop for the rest of the nodes
 for i=2:1:N         
    father=find(C(:,Priority(i))~=0);%Finding the parent of the current node i
    [num_father,temp]=size(father);
    
    %Loop for each processor
    for m=1:1:P
        
        for k=1:1:num_father
            if m==node_inprocess(father(k))
                temp(m,k)=EFT_min(father(k));
            else
                temp(m,k)=EFT_min(father(k))+C(father(k),Priority(i));
            end
        end
        
        if now(m)==0
            EST(Priority(i),m)=max(temp(m,:));
            EFT(Priority(i),m)=EST(Priority(i),m)+W(Priority(i),m);
        else
            EST(Priority(i),m)=max([EFT_min(now(m)),max(temp(m,:))]);
            EFT(Priority(i),m)=EST(Priority(i),m)+W(Priority(i),m);
        end
    end
        
        EFT_min(Priority(i))=min(EFT(Priority(i),:));% Calculating minimum EFT or AFT.
        node_inprocess(Priority(i))=find(min(EFT(Priority(i),:))==EFT(Priority(i),:));%Find the Processor being used by this node.
        now(node_inprocess(Priority(i)))=Priority(i);
        process(node_inprocess(Priority(i))).member=[process(node_inprocess(Priority(i))).member,Priority(i)];%find all the task of each processor.
        
 end
 
end
