// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlenumToCommandLoyaltyLedger {
    address public steward;

    struct LoyaltyEntry {
        string officialName; // "General Li Shangfu"
        string purgeEvent; // "Fourth Plenum"
        string loyaltySignal; // "Removed", "Reassigned", "Under investigation"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    LoyaltyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logLoyaltyShift(string memory officialName, string memory purgeEvent, string memory loyaltySignal, string memory emotionalTag) external onlySteward {
        entries.push(LoyaltyEntry(officialName, purgeEvent, loyaltySignal, emotionalTag, true, false));
    }

    function sealLoyaltyEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getLoyaltyEntry(uint256 index) external view returns (LoyaltyEntry memory) {
        return entries[index];
    }
}
