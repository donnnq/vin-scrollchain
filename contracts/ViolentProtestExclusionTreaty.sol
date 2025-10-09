// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ViolentProtestExclusionTreaty {
    address public originator;

    mapping(address => bool) public isExcluded;

    event ExclusionLogged(address indexed individual, string reason, uint256 timestamp);

    constructor() {
        originator = msg.sender;
    }

    function excludeIndividual(address individual, string memory reason) external {
        isExcluded[individual] = true;
        emit ExclusionLogged(individual, reason, block.timestamp);
    }

    function checkEligibility(address individual) external view returns (bool) {
        return !isExcluded[individual];
    }
}
