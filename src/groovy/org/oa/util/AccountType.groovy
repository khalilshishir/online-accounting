package org.oa.util

/**
 * Created by Saedur Rahman on 12/2/14.
 */
public enum AccountType {

    SAVING("saving"),
    CURRENT("Current"),
    CHEQUE("cheque"),

    final String value

    AccountType(String value) {
        this.value = value
    }

    String toString() { value }
    String getKey() { name() }
}