// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegistryToConsumerAlertSystem {
    address public steward;

    struct AlertEntry {
        string product; // "Unsafe or unverified tech export"
        string clause; // "Scrollchain-sealed alert system for consumer safety, public awareness, and planetary consequence"
        string emotionalTag;
        bool triggered;
        bool sealed;
    }

    AlertEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function triggerAlert(string memory product, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(AlertEntry(product, clause, emotionalTag, true, false));
    }

    function sealAlertEntry(uint256 index) external onlySteward {
        require(entries[index].triggered, "Must be triggered first");
        entries[index].sealed = true;
    }

    function getAlertEntry(uint256 index) external view returns (AlertEntry memory) {
        return entries[index];
    }
}
