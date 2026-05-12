package utils;

import jason.asSemantics.DefaultInternalAction;
import jason.asSemantics.TransitionSystem;
import jason.asSemantics.Unifier;
import jason.asSyntax.NumberTerm;
import jason.asSyntax.NumberTermImpl;
import jason.asSyntax.Term;

import java.util.Random;

/*
    - Snake case to match Jason's naming convention;
    - need to extend DefaultInternalAction that will require execute method override.
*/
public class rand_int extends DefaultInternalAction {
    private static final Random RAND = new Random();

    /**
     * @param ts TransitionSystem
     * @param un unifier to unify the result with the first argument
     * @param args actual arguments passed to the internal action. Term is the base class for all terms in Jason (top type)
     */
    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        int min = (int) ((NumberTerm) args[1]).solve(); // convert logic number into Java int
        int max = (int) ((NumberTerm) args[2]).solve();
        int result = RAND.nextInt(max - min) + min;
        return un.unifies(args[0], new NumberTermImpl(result));
    }
}
