package org.oa.util

/**
 * Created by Saedur Rahman on 12/13/14.
 */
public enum CoAMasterAccountStatus {

    Active("Active"),
    IN_Active("In Active"),
    DEFFERED("Deffered"),


    final String value

    CoAMasterAccountStatus(String value) {
        this.value = value
    }

    String toString() { value }
    String getKey() { name() }
}