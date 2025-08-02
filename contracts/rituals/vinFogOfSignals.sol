// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinFogOfSignals {
    event FogPulseEmitted(uint256 intensity);

    function emitFogPulse(uint256 intensity) public {
        require(intensity <= 10000, "Too intense!");
        emit FogPulseEmitted(intensity);
    }
}
