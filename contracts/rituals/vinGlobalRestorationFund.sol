// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinGlobalRestorationFund {
    uint256 public constant ALLOCATION = 300_000_000_000 * 1e18; // $300B in wei (assuming 1e18 = $1)
    string[] public eligibleNations;
    mapping(string => bool) public isBlacklisted;
    mapping(string => bool) public hasClaimed;
    mapping(string => uint256) public fundLedger;

    event FundAllocated(string nation, uint256 amount);
    event NationBlacklisted(string nation);

    constructor() {
        // Blacklist hostile actors
        isBlacklisted["Russia"] = true;
        isBlacklisted["China"] = true;
        isBlacklisted["North Korea"] = true;

        emit NationBlacklisted("Russia");
        emit NationBlacklisted("China");
        emit NationBlacklisted("North Korea");
    }

    function registerNation(string memory nation) public {
        require(!isBlacklisted[nation], "Nation is blacklisted.");
        require(!hasClaimed[nation], "Already claimed.");
        eligibleNations.push(nation);
        fundLedger[nation] = ALLOCATION;
        hasClaimed[nation] = true;
        emit FundAllocated(nation, ALLOCATION);
    }

    function getFund(string memory nation) public view returns (uint256) {
        return fundLedger[nation];
    }

    function totalEligible() public view returns (uint256) {
        return eligibleNations.length;
    }

    function isNationBlacklisted(string memory nation) public view returns (bool) {
        return isBlacklisted[nation];
    }
}
