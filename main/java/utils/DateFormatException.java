package utils;

public class DateFormatException extends RuntimeException {

    DateFormatException(String message) {
        super(message);
    }

    public DateFormatException(String message, Throwable throwable) {
        super(message, throwable);
    }
}
