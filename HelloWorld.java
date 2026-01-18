// public class HelloWorld {
//     public static void main(String[] args) {
//         System.out.println("Hello from Java running inside Docker 🚀");
//     }
// }

@RestController
public class HelloController {
    @GetMapping("/")
    public String hello() {
        return "Hello from Docker + Jenkins!";
    }
}
