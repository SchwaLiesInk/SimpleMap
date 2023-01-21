double f1(double x,double r,double n){
  return n*r*x*(1.0-x);
}
int n=45;//120;
float m=25;//1+(int)(random(3)+random(3)+random(3));
double sx=1+random(1)-random(1);
float s1=1+random(1)-random(1);
float s2=1+random(1)-random(1);
float s3=1+random(1)-random(1);
float s4=1+random(1)-random(1);
float g1=m+random(m);
float g2=m+random(m)*2;
float g3=m+random(m)*3;
float g4=m+random(m)*5;
float g5=m+random(m)*7;
float scale=10;
double sr=0.8+random(0.2);
boolean start=true;
double k=0;
float ly=4;
float a=0;
float rot=0;
float sides=(4+(int)random(4)-(int)random(4))*2;
float sc=0.8+random(0.2);
float r=512+random(5120);
float g=512+random(5120);
float b=512+random(5120);

void setup(){
size(800,800);

    background(0);
    //g1*=g1;
    //g2*=g2;
    //g3*=g3;
    //g4*=g4;
}
void draw(){
  //fill(0,0,0,16);
  //rect(0,0,width,height);
  k+=((double)(n)*0.0001);
  float na=(PI*2)/(n*sides);//euclidian
  rot+=na;
  //scale+=0.01;
  //ly-=0.01;
  sc=(float)(scale);
  float sc1=scale*s1;
  float sc2=scale*s2;
  float sc3=scale*s3;
  float sc4=scale*s4;
  //sc=(float)f1(sc,sr,ly);
  if(k>n){
    k/=n+k*g5;
  //background();
  //if(ly<0)start=false;
  }
  
  if(start){
    
    //stroke(255,255,255,255);
    double lax=0;
    double ax=0;
    for(int j=0;j<n;j++){
    double x=sx+(sx*(k-j))/(1+j);//+((1.0-sx)*j/n)/(1+j);
    double r1=sr+(sr*(k-j))/(1+j);
    for(int i=0;i<n;i++){
    a+=na;
    if(a>Math.PI*2){a-=Math.PI*2;}
    double lx=x;
    x=f1(x,r1,ly);
    lax=ax/x;
    ax=(x-lx);
   // float x1=((float)(i-400)/n*i)*0.5f;
   // float x2=((float)(j-400)/n*j)*0.5f;
    float y1=((float)((ax*ax+lax)*200));
    float y2=((float)((lax*lax+ax)*200));
    float r2=(float)(x/(y1*y1+y2*y2+ax*ax+lax*lax+x*x+Math.PI));
    float r3=(sqrt(r2)*2);
    float rd=(sqrt(r2)*r*8)/255;
    float gn=(sqrt(r2)*g*8)/255;
    float bl=(sqrt(r2)*b*8)/255;
    float rr1=g1*r2;
    float rr2=g2*r2;
    float rr3=g3*r2;
    float rr4=g4*r2;
    float rr5=g5*r2;
    stroke((int)((i+j+k)*rd)%255,(int)((j+k)*gn)%255,(int)((i+k)*bl)%255,16);
    //point(400+(y2)*sin(a+rr1-rr3)*sc,400+(y1)*cos(a+rr2-rr4)*sc);//star
    //point(400+(y1-y2)*sin(a+rr1-rr3)*sc,400+(y1+y2)*cos(a+rr2-rr4)*sc);//star
    float yn1=(y2+y1)*sin(a+rr1-rr3);//-(y1-y2)*sin(a+rr2-rr4)*sc;
    float yn2=(y1-y2)*cos(a+rr2-rr4);//-(y1+y2)*cos(a+rr1-rr3)*sc;
    float yna=y2*(cos(a+rr3)+sin(a+rr1));//(y1+y2)*sin(a+rr1-rr3)*sc;
    float ynb=y1*(cos(a+rr2)+sin(a+rr4));//(y1-y2)*cos(a+rr2-rr4)*sc;
    
float nua=y1-rr1;//parallel view
float nub=y2-rr2;//parallel view
float nuc=y1-rr3;//parallel view
float nud=y2-rr4;//parallel view

 nua=(float)(Math.sin(nua+lax))*a;
 nub=(float)(Math.sin(nub+lax))*a;
 nuc=(float)(Math.sin(nuc+lax))*a;
 nud=(float)(Math.sin(nud+lax))*a;
    float rot2=rot*r3;
    float ynd=yn1*cos(rot2+nua)-yn2*sin(rot2+nub);
    float yne=yn2*cos(rot2+nub)+yn1*sin(rot2+nuc);
    float yn3=yna*cos(rot2+nuc)-ynb*sin(rot2+nud);
    float yn4=ynb*cos(rot2+nud)+yna*sin(rot2+nua);
    point(400+(yn1+yna)*sc1,400+(yn2+ynb)*sc2);
    point(400+(yn3+ynd)*sc3,400+(yn4+yne)*sc4);
    point(400+(yn1-yna)*sc4,400+(yn2-ynb)*sc3);
    point(400+(yn3-ynd)*sc2,400+(yn4-yne)*sc1);
    //point(400+x2*sin(a)*scale,400+y2*cos(a)*scale);
    //point(400+y1*cos(a)*scale,400+x1*sin(a)*scale);
    //point(400+x1*cos(a)*scale,400+y1*sin(a)*scale);
    //point(400+x2*cos(a)*scale,400+y2*sin(a)*scale);
    //line(400+x1*cos(a)*scale,400+y1*sin(a)*scale,400+x1*sin(a)*scale,400+y2*cos(a)*scale);
    }
  }
  //start=false;
  }
}