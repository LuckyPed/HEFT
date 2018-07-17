function [RankD,PriorityD] = Downward_Ranking( C,W_ave )
 [N,~]=size(C);
 RankD=zeros(1,N);% note that Downward Ranking is always 0 for Entry node. 
 for i=2:1:11
     % making a digraph so we can get the pred/succ easier.
     G = digraph(C);
     pred=predecessors(G,i);
     [num1,~]=size(pred);
     for m=1:1:num1
         tempd(m)=RankD(pred(m))+W_ave(pred(m),1)+C(pred(m),i);
     end
     max_num=max(tempd);
     RankD(i)=max_num;
 end
 
 [RankD,PriorityD] = sort(RankD,'ascend');
 
end
