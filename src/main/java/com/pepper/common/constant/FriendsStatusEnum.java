package com.pepper.common.constant;

import java.util.Arrays;
import java.util.Objects;

public enum FriendsStatusEnum {

    success(0, "success"),
    apply(1, "apply"),
    waitagree(2, "waitagree"),
    reject(3, "reject"),
    bereject(4, "bereject"),
    delete(5, "delete");

    private Integer type;
    private String desc;

    FriendsStatusEnum(int type, String desc) {
        this.type = type;
        this.desc = desc;
    }

    public Integer getType() {
        return type;
    }

    public String getDesc() {
        return desc;
    }

    public static String getByValue(int value) {
        for (FriendsStatusEnum typeEnum : FriendsStatusEnum.values()) {
            if (typeEnum.type == value) {
                return typeEnum.getDesc();
            }
        }
        return "";
    }

    public static boolean containsType(String type) {
        return Arrays.stream(FriendsStatusEnum.values())
                .map(FriendsStatusEnum::getType)
                .distinct().anyMatch(s -> Objects.equals(s, type));
    }

}
