package karateCore.karateObj;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

/**
 * @Auther: qiaolinchen
 * @Date: 2020/9/4 09:02
 * @Description:
 */
@RunWith(Karate.class)
@KarateOptions(tags = {"~@ignore"})
public class karateObjRunner {
    @BeforeClass
    public static void setUp(){
        System.setProperty("karate.env","localhost");
    }
}
