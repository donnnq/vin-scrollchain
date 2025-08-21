// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinReliefContract {
    address public steward;
    mapping(string => uint256) public reliefFund;

    event ReliefDeployed(string nation, uint256 amount);

    constructor() {
        steward = msg.sender;
        reliefFund["France"] = 250_000_000_000;
        reliefFund["Germany"] = 250_000_000_000;
        reliefFund["EU"] = 250_000_000_000;
        reliefFund["UK"] = 250_000_000_000;

        emit ReliefDeployed("France", reliefFund["France"]);
        emit ReliefDeployed("Germany", reliefFund["Germany"]);
        emit ReliefDeployed("EU", reliefFund["EU"]);
        emit ReliefDeployed("UK", reliefFund["UK"]);
    }

    function getRelief(string memory nation) public view returns (uint256) {
        return reliefFund[nation];
    }
}
