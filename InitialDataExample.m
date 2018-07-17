clear
clc
N = 11; % Number of Nodes for our example.
C=zeros(N,N); % Creating a NxN Matrix with zeros.

% Inputing the Data for our DAG, C is the cost of moving between each node.
C(1,2)=12;
C(1,3)=14;
C(2,4)=8;
C(2,5)=15;
C(2,6)=11;
C(3,7)=13;
C(4,8)=11;
C(5,8)=8;
C(6,9)=7;
C(6,10)=12;
C(7,10)=14;
C(8,11)=15;
C(9,11)=7;
C(10,11)=10;

% W is the processing time needed for each node, in each process.
W(1,1)=7;
W(1,2)=9;
W(1,3)=8;
W(2,1)=10;
W(2,2)=9;
W(2,3)=14;
W(3,1)=5;
W(3,2)=7;
W(3,3)=6;
W(4,1)=6;
W(4,2)=8;
W(4,3)=7;
W(5,1)=10;
W(5,2)=8;
W(5,3)=6;
W(6,1)=11;
W(6,2)=13;
W(6,3)=15;
W(7,1)=12;
W(7,2)=15;
W(7,3)=18;
W(8,1)=10;
W(8,2)=13;
W(8,3)=7;
W(9,1)=8;
W(9,2)=9;
W(9,3)=10;
W(10,1)=15;
W(10,2)=11;
W(10,3)=13;
W(11,1)=8;
W(11,2)=9;
W(11,3)=10;

NodeNames={'T0','T1','T2','T3','T4','T5','T6','T7','T8','T9','T10'};

[EFT,EST,AFT] = HEFT(C,W,3,NodeNames,1);
Makespan = max(AFT(N));