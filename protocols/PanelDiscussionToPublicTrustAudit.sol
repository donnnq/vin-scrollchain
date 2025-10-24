// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PanelDiscussionToPublicTrustAudit {
    address public steward;

    struct PanelEntry {
        string showTitle; // "Politiko Quickie!"
        string topic; // "Ombudsman delay", "Senate grilling"
        string trustSignal; // "Transparency demand", "Institutional fatigue"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    PanelEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditPanel(string memory showTitle, string memory topic, string memory trustSignal, string memory emotionalTag) external onlySteward {
        entries.push(PanelEntry(showTitle, topic, trustSignal, emotionalTag, true, false));
    }

    function sealPanelEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getPanelEntry(uint256 index) external view returns (PanelEntry memory) {
        return entries[index];
    }
}
