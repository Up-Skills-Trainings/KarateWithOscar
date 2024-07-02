package examples.cydeo;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate testCydeo() {
        return Karate.run("spartanFlow").tags("@smoke").relativeTo(getClass());
    }

}
