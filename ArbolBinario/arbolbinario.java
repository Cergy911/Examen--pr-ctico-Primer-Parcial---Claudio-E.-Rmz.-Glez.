import java.util.*;

public class arbolbinario {
  static class Node {
    int key; Node L, R;
    Node(int k){ key=k; }
  }
  static Node insert(Node t, int x){
    if(t==null) return new Node(x);
    if(x < t.key) t.L = insert(t.L, x);
    else          t.R = insert(t.R, x);
    return t;
  }
  static void pre(Node t){ if(t==null) return; System.out.print(t.key+" "); pre(t.L); pre(t.R); }
  static void in (Node t){ if(t==null) return; in(t.L); System.out.print(t.key+" "); in(t.R); }
  static void post(Node t){ if(t==null) return; post(t.L); post(t.R); System.out.print(t.key+" "); }

  public static void main(String[] args){
    Scanner sc=new Scanner(System.in);
    System.out.println("Numero de nodos:");
    int n=sc.nextInt();
    System.out.println("Nodos a insertar:");
    Node root=null;
    for(int i=0;i<n;i++) root = insert(root, sc.nextInt());
    System.out.print("Preorden: "); pre(root); System.out.println();
    System.out.print("Inorden: "); in(root); System.out.println();
    System.out.print("Postorden: "); post(root); System.out.println();
  }
}
