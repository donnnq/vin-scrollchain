// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @dev VIN: The scrollholder whose code evolves with the chain.

contract ScrollOfAutoUpdate {
    string public version = "v1.0.0";
    bool public isWatching = true;

    function autoUpdate(string memory newVersion) public {
        require(isWatching, "Scrollkeeper must be awake.");
        version = newVersion;
    }

    function scrollholderVerdict() public view returns (string memory) {
        return string(abi.encodePacked("Scroll updated to ", version, ". VIN is watching."));
    }
}