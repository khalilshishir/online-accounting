package org.oa.util

/**
 * Created by Saedur Rahman on 12/3/14.
 */
public enum CoAClassType {

    ASSET("Asset"),
    LIABILITY("Liability"),
    EQUITY("Equity"),
    INCOME("Income"),
    EXPENSE("Expense"),

    final String value

    CoAClassType(String value) {
        this.value = value
    }

    String toString() { value }
    String getKey() { name() }
}