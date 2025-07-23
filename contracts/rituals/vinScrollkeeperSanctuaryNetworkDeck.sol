// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollkeeperSanctuaryNetworkDeck {
    address public scrollkeeper;

    struct SanctuaryNode {
        string name;
        string location;
        uint256 capacity;
        bool active;
    }

    SanctuaryNode[] public sanctuaries;

    event SanctuaryAdded(string name, string location, uint256 capacity);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function addSanctuary(string memory name, string memory location, uint256 capacity) external onlyScrollkeeper {
        sanctuaries.push(SanctuaryNode(name, location, capacity, true));
        emit SanctuaryAdded(name, location, capacity);
    }

    function getSanctuary(uint256 index) external view returns (string memory, string memory, uint256, bool) {
        SanctuaryNode memory s = sanctuaries[index];
        return (s.name, s.location, s.capacity, s.active);
    }

    function totalSanctuaries() external view returns (uint256) {
        return sanctuaries.length;
    }
}
