// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollOfFallbacks {
    event FallbackTriggered(string layer);

    fallback() external payable {
        emit FallbackTriggered("Primary fallback activated");
        secondaryFallback();
    }

    function secondaryFallback() internal {
        emit FallbackTriggered("Secondary fallback activated");
    }
}
