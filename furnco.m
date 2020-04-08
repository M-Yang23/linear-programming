L1=[-0.5,0;13,0]; 
plot(L1(:,1),L1(:,2));hold on 
text(13,0,'x_1=0','color','b'); 
L2=[0,-0.5;0,17]; 
plot(L2(:,1),L2(:,2));hold on 
text(0,5.1,'x_2=0','color','b'); 
L3=[-1,18;14,-2]; 
plot(L3(:,1),L3(:,2));hold on 
text(1,16,'4x_1+3x_2=50','color','b') 
L4=[0,0;4,16]; 
plot(L4(:,1),L4(:,2)); 
text(4,16.1,'4x_1=x_2','color','b') 
x=[0 12.5 3.125]'; 
y=[0 0 12.5]'; 
fill(x,y,'c'); 
ylabel('x_2') 
xlabel('x_1') 
axis([-0.5 14 -0.5 18]) 

z0=[81/8,2;1,251/16]; 
plot(z0(:,1),z0(:,2),'k--','LineWidth',2); 
text(10,1.75,'z=343.75') 
z1=[1,15;29/3,2]; 
plot(z1(:,1),z1(:,2),'k--','Linewidth',2); 
text(8,2,'z=330') 
 
text(3.5,12.5,'A_1(3.125,12.5)','color','r','fontsize',12); 
text(1,12,'A_2(3,12)','color','r','fontsize',12); 