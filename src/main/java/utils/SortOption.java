package utils;

import java.util.Comparator;
import java.util.function.Function;

public class SortOption {
    private String direction; // "asc" hoặc "desc"

    public SortOption(String direction) {
        this.direction = direction;
    }

    public String getDirection() {
        return direction;
    }

    public boolean isAscending() {
        return "asc".equalsIgnoreCase(direction);
    }

    public <T extends Comparable<T>> Comparator<T> getComparator() {
        return isAscending() ? Comparator.naturalOrder() : Comparator.reverseOrder();
    }

    public <T, U extends Comparable<U>> Comparator<T> getComparator(Function<T, U> keyExtractor) {
        return isAscending() ? Comparator.comparing(keyExtractor) : Comparator.comparing(keyExtractor).reversed();
    }
}
