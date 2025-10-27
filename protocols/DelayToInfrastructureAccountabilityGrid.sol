// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DelayToInfrastructureAccountabilityGrid {
    address public steward;

    struct GridEntry {
        string delay; // "4-year delay in housing completion"
        string clause; // "Scrollchain-sealed grid for infrastructure audit, contractor accountability, and shelter consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    GridEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexDelay(string memory delay, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(GridEntry(delay, clause, emotionalTag, true, false));
    }

    function sealGridEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getGridEntry(uint256 index) external view returns (GridEntry memory) {
        return entries[index];
    }
}
