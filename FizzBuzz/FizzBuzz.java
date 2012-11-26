/**
 * http://www.se.rit.edu/~se350/Class_Activities/00_InitialAssessment/FizzBuzz.html
 * @author jxz6853
 *
 */
public class FizzBuzz {
	public void fizz_buzz() {
		for(int i = 0; i <= 100; i++) {
			if(i % 3 == 0 && i % 5 == 0)
				System.out.println("FizzBuzz");
			else if(i % 3 == 0)
				System.out.println("Fizz");
			else if(i % 5 == 0)
				System.out.println("Buzz");
			else
				System.out.println(i);
		}
	}
}

