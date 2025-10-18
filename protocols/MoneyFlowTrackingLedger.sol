// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MoneyFlowTrackingLedger {
    address public admin;

    struct FlowEntry {
        string source;
        string destination;
        string method;
        string emotionalTag;
        bool summoned;
        bool tracked;
        bool confirmedOrigin;
    }

    FlowEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFlow(string memory source, string memory destination, string memory method, string memory emotionalTag) external onlyAdmin {
        entries.push(FlowEntry(source, destination, method, emotionalTag, true, false, false));
    }

    function trackFlow(uint256 index) external onlyAdmin {
        entries[index].tracked = true;
    }

    function confirmOrigin(uint256 index) external onlyAdmin {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].confirmedOrigin = true;
    }

    function getFlowEntry(uint256 index) external view returns (FlowEntry memory) {
        return entries[index];
    }
}
