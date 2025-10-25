// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TrialToJudicialConsequenceGrid {
    address public steward;

    struct ConsequenceEntry {
        string trialOrigin; // "Freeze protocol", "Senate summons", "Scrollchain tribunal"
        string verdictType; // "Guilty", "Negligence", "Breach of mandate"
        string consequenceAction; // "Impeachment", "Asset seizure", "Public apology"
        string emotionalTag;
        bool enforced;
        bool sealed;
    }

    ConsequenceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function enforceConsequence(string memory trialOrigin, string memory verdictType, string memory consequenceAction, string memory emotionalTag) external onlySteward {
        entries.push(ConsequenceEntry(trialOrigin, verdictType, consequenceAction, emotionalTag, true, false));
    }

    function sealConsequenceEntry(uint256 index) external onlySteward {
        require(entries[index].enforced, "Must be enforced first");
        entries[index].sealed = true;
    }

    function getConsequenceEntry(uint256 index) external view returns (ConsequenceEntry memory) {
        return entries[index];
    }
}
