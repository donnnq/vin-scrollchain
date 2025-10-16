// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TariffConsequenceBroadcastPack {
    address public admin;

    struct BroadcastEntry {
        string policyLabel;
        string consequenceMessage;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory policyLabel, string memory consequenceMessage, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(policyLabel, consequenceMessage, emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
