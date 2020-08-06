/**
 * @author wym
 */
public class circle {
    public static void main(String[] args) {
        for (int i = 0; i<5; i++){
            int j = i;
            System.out.println("for: : " + i);
            while (j < 4){
                if (j == 2){
                    j++;
                    break ;
                }
                System.out.println("while: " + j);
                j++;
            }
            System.out.println(" 222for: : " + i);
        }
    }
}
