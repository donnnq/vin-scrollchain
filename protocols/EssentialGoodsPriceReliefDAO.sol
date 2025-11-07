// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EssentialGoodsPriceReliefDAO {
    address public steward;

    struct ReliefEntry {
        string timestamp;
        string barangay;
        string goodType;
        string subsidyLevel;
        string marketProtectionAction;
        string emotionalTag;
    }

    ReliefEntry[] public registry;

    event PriceReliefGranted(string timestamp, string barangay, string goodType, string subsidyLevel, string marketProtectionAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function grantRelief(
        string memory timestamp,
        string memory barangay,
        string memory goodType,
        string memory subsidyLevel,
        string memory marketProtectionAction,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ReliefEntry(timestamp, barangay, goodType, subsidyLevel, marketProtectionAction, emotionalTag));
        emit PriceReliefGranted(timestamp, barangay, goodType, subsidyLevel, marketProtectionAction, emotionalTag);
    }
}
