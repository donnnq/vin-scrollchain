// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinMirrorHack {
    event HostileReflected(address origin);

    function reflectHostileIntent(address origin) public {
        emit HostileReflected(origin);
    }
}
