import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.Before;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@KarateOptions(tags = {"~@ignore"})
public class VMockRunner {
    // this will run all *.feature files that exist in sub-directories
    // refer to https://github.com/intuit/karate#naming-conventions
    // for folder-structure recommendations and naming conventions
    @Before
    public static void setUp(){

    }
}