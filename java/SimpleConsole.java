import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class SimpleConsole {

    public static void main(String[] args) {
        new SimpleConsole();
    }

    enum Command {
        echo, sing, quit
    }

    private SimpleConsole() {
        trace("[Welcome!]");
        execute();
    }

    private void execute() {
        trace("[Enter your command below]");

        // get input from user
        String input = getInput();

        if (input.toLowerCase().equals(Command.quit.toString())) {
            trace("[Bye]");
            return; // escape
        }

        if (input.toLowerCase().equals(Command.echo.toString())) {
            trace("[Enter some text below:]");
            trace("[Ok, I see: '" + getInput() + "'");
        }

        else if (input.toLowerCase().equals(Command.sing.toString())) {
            trace(" ♪ ♩ ♫ ♬ ¶ ‖♭ ♯ § ∮  ♪ ♩ ♫ ♬ ¶ ‖♭ ♯ § ∮");
        }

        else {
            System.out.println("[Oops... no such command]");
        }

        execute();
    }

    private String getInput() {

        BufferedReader bufferedReader =
                new BufferedReader(
                        new InputStreamReader(System.in));

        String input = null;
        try {
            input = bufferedReader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return input;
    }

    private void trace(String s) {
        System.out.println(s);
    }

}
