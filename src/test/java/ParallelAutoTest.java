import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.Assert.*;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.BeforeClass;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ParallelAutoTest {
    @BeforeClass
    public static void beforeClass() throws Exception{
        //可在此处启动后台服务
    }

    @Test
    public void testParallel(){
        Results results =Runner.parallel(getClass(),20,"target/karatedemoReport");

        generateReport(results.getReportDir());
        assertTrue(results.getErrorMessages(), results.getFailCount()==0);
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "karatedemoReport");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
