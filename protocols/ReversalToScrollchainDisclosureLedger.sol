// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReversalToScrollchainDisclosureLedger {
    address public steward;

    struct DisclosureEntry {
        string caseName; // "Villanueva dismissal reversal"
        string reversalDate; // "2019"
        string disclosureMethod; // "Scrollchain broadcast", "Senate hearing", "Public archive"
        string emotionalTag;
        bool disclosed;
        bool sealed;
    }

    DisclosureEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function discloseReversal(string memory caseName, string memory reversalDate, string memory disclosureMethod, string memory emotionalTag) external onlySteward {
        entries.push(DisclosureEntry(caseName, reversalDate, disclosureMethod, emotionalTag, true, false));
    }

    function sealDisclosureEntry(uint256 index) external onlySteward {
        require(entries[index].disclosed, "Must be disclosed first");
        entries[index].sealed = true;
    }

    function getDisclosureEntry(uint256 index) external view returns (DisclosureEntry memory) {
        return entries[index];
    }
}
