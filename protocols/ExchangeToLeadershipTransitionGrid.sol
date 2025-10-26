// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExchangeToLeadershipTransitionGrid {
    address public steward;

    struct TransitionEntry {
        string exchangeName; // "Binance"
        string transitionClause; // "Scrollchain-sealed index of executive shifts, advisory roles, and governance impact"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    TransitionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexTransition(string memory exchangeName, string memory transitionClause, string memory emotionalTag) external onlySteward {
        entries.push(TransitionEntry(exchangeName, transitionClause, emotionalTag, true, false));
    }

    function sealTransitionEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getTransitionEntry(uint256 index) external view returns (TransitionEntry memory) {
        return entries[index];
    }
}
