// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiddleClassDignityIndex {
    address public steward;

    struct DignityEntry {
        string timestamp;
        string region;
        uint256 wageSecurityScore;
        uint256 housingAccessScore;
        uint256 educationSupportScore;
        string emotionalTag;
    }

    DignityEntry[] public index;

    event MiddleClassDignityIndexed(string timestamp, string region, uint256 wageSecurityScore, uint256 housingAccessScore, uint256 educationSupportScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexDignity(
        string memory timestamp,
        string memory region,
        uint256 wageSecurityScore,
        uint256 housingAccessScore,
        uint256 educationSupportScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(DignityEntry(timestamp, region, wageSecurityScore, housingAccessScore, educationSupportScore, emotionalTag));
        emit MiddleClassDignityIndexed(timestamp, region, wageSecurityScore, housingAccessScore, educationSupportScore, emotionalTag);
    }
}
