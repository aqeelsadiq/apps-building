import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;

public class Main {
    public static void main(String[] args) throws IOException {
        // Create a new HttpServer instance listening on port 3000
        HttpServer server = HttpServer.create(new InetSocketAddress(3000), 0);

        // Define a handler to process incoming requests
        server.createContext("/", new HttpHandler() {
            @Override
            public void handle(HttpExchange exchange) throws IOException {
                String response = "Hello, World! This is my java application";
                exchange.sendResponseHeaders(200, response.length());
                OutputStream os = exchange.getResponseBody();
                os.write(response.getBytes());
                os.close();
            }
        });

        // Start the server
        server.setExecutor(null); // creates a default executor
        System.out.println("Server is running on http://localhost:3000/");
        server.start();
    }
}
