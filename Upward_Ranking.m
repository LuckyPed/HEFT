function [RankU,PriorityU] = Upward_Ranking( C,W_ave )
 [N,~]=size(C);
 RankU(N)=W_ave(N,1);
 for i=N-1:-1:1
     % Getting succesor of our node.
     succ=find(C(i,:)~=0);
     [~,num2]=size(succ);
     for m=1:1:num2
         temp(m)=C(i,succ(m))+RankU(succ(m));
     end
     max_num=max(temp);
     RankU(i)=W_ave(i)+max_num;
 end
 
 %Note that for Upward Ranking, we sort it by descending direction.
 [RankU,PriorityU] = sort(RankU,'descend');
 
end
