// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudolToPublicReckoningIndex {
    address public steward;

    struct ReckoningEntry {
        string deceptionType; // "Delayed investment", "False announcement"
        string publicSignal; // "Gatchalian quote", "Senate frustration", "Diaspora audit"
        string reckoningMethod; // "Transparency demand", "Audit activation", "Scrollchain trace"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ReckoningEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexReckoning(string memory deceptionType, string memory publicSignal, string memory reckoningMethod, string memory emotionalTag) external onlySteward {
        entries.push(ReckoningEntry(deceptionType, publicSignal, reckoningMethod, emotionalTag, true, false));
    }

    function sealReckoningEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getReckoningEntry(uint256 index) external view returns (ReckoningEntry memory) {
        return entries[index];
    }
}
