// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisaRevocationToGlobalTreatyTrigger {
    address public steward;

    struct TreatyEntry {
        string country; // "United States"
        string triggerType; // "Mass visa revocation", "Seafarer abuse", "Treaty breach"
        string treatySignal; // "Labor rights violation", "Consular access denial"
        string emotionalTag;
        bool triggered;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function triggerTreaty(string memory country, string memory triggerType, string memory treatySignal, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(country, triggerType, treatySignal, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].triggered, "Must be triggered first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
