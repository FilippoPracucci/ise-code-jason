package env;

import jason.asSyntax.Literal;
import jason.asSyntax.Structure;
import jason.environment.Environment;

import java.util.Collection;
import java.util.Collections;
import java.util.Random;
import java.util.logging.Logger;

public class TemperatureEnvironment extends Environment {

    private static final Random RAND = new Random();

    // action literals
    public static final Literal hotAir = Literal.parseLiteral("spray_air(hot)");
    public static final Literal coldAir = Literal.parseLiteral("spray_air(cold)");

    static Logger logger = Logger.getLogger(TemperatureEnvironment.class.getName());

    /* Variable properties of the environment. If not simulation there will be a function retrieving the value from a sensor */
    private double temperature;

    /**
     * Callback when the environment is initialized
     * 
     * @param args the arguments passed to the environment from thermostat.mas2j configuration file
     */
    @Override
    public void init(final String[] args) {
        if (args.length >= 1) {
            temperature = Double.parseDouble(args[0]);
        } else {
            temperature = RAND.nextDouble() * 20 + 10;
        }
    }

    /**
     * Callback when the agent observes (percepts) the environment (what the agent perceives from the environment in the present).
     * Function called continuosly by the BDI control loop of the agent.
     * In a real world scenario care about the spatial position of the agent.
     * 
     * @param agName the name of the agent
     */
    @Override
    public Collection<Literal> getPercepts(String agName) {
        return Collections.singletonList(
                Literal.parseLiteral(String.format("temperature(%s)", temperature)) // parse this string as a belief literal, e.g., temperature(15)
        );
    }

    private static final double FAILURE_PROBABILITY = 0.2;

    /**
     * Callback when the agent perform the action.
     * Can be added a conditional layer in base of the agent (sort of a permission).
     */
    @Override
    public boolean executeAction(final String ag, final Structure action) {
        boolean result = true;
        if (RAND.nextDouble() < FAILURE_PROBABILITY) {
            result = false; // force the failure
        } else if (action.equals(hotAir)) { // refer to the costant literal defined above
            temperature += 0.1 * RAND.nextDouble();
        } else if (action.equals(coldAir)) { // refer to the costant literal defined above
            temperature -= 0.1 * RAND.nextDouble();
        } else {
            RuntimeException e = new IllegalArgumentException("Cannot handle action: " + action);
            logger.warning(e.getMessage());
            throw e;
        }
        try {
            Thread.sleep(500L); // Slowdown the system (simulate the time needed to perform the action of spraying air)
        } catch (InterruptedException ignored) {
        }
        return result;
    }
}
