function [RankL,PriorityL] = Level_Ranking( C )
 [N,~]=size(C);
 RankL=zeros(1,N);% note that Downward Ranking is always 0 for Entry node. 
 for i=2:1:11
     % making a digraph so we can get the pred/succ easier.
     G = digraph(C);
     pred=predecessors(G,i);
     [num1,~]=size(pred);
     for m=1:1:num1
         templ(m)=RankL(pred(m))+1;
     end
     max_num=max(templ);
     RankL(i)=max_num;
 end
 
 [RankL,PriorityL] = sort(RankL,'ascend');
 
end
