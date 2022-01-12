public class Method{

    public static void main(String[] args){

        welcome();
        add(5, 6);
        fly();
        divide(10, 2.0);

    }

    public static void welcome(){
        System.out.println("Welcome Homies!");

    }

    public static void add(int a, int c){
        System.out.println(a + c);
       
    }

    public static void fly(){
        System.out.println("Now let's switch it up!");

    }

    public static void divide(int d, double e){
        System.out.println(d / e);

    }
}