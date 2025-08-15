// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NoAidFromMe {
    address public originator;
    string public declaration;

    event AidBlocked(string country, string reason);

    constructor() {
        originator = msg.sender;
        declaration = "No aid, support, or cooperation shall flow from me to Russia or the United States.";
    }

    function blockAid(string memory country) public {
        require(
            keccak256(abi.encodePacked(country)) == keccak256(abi.encodePacked("Russia")) ||
            keccak256(abi.encodePacked(country)) == keccak256(abi.encodePacked("United States")),
            "Only Russia or US can be blocked."
        );
        emit AidBlocked(country, "Declared non-cooperation and zero resource flow.");
    }
}
