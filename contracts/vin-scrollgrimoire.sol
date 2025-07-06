// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollGrimoire {
    struct Grimoire {
        string name;
        string purpose;
        address[] scrolls;
        bool sealed;
        uint256 timestamp;
    }

    Grimoire[] public grimoires;
    address public immutable grimoireKeeper;

    event GrimoireCreated(uint256 indexed id, string name, string purpose);
    event ScrollAdded(uint256 indexed grimoireId, address scroll);
    event GrimoireSealed(uint256 indexed id, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == grimoireKeeper, "Not the grimoire keeper");
        _;
    }

    constructor() {
        grimoireKeeper = msg.sender;
    }

    function createGrimoire(string calldata name, string calldata purpose) external onlyKeeper {
        grimoires.push(Grimoire({
            name: name,
            purpose: purpose,
            scrolls: new address[](0),
            sealed: false,
            timestamp: block.timestamp
        }));

        emit GrimoireCreated(grimoires.length - 1, name, purpose);
    }

    function addScroll(uint256 grimoireId, address scroll) external onlyKeeper {
        require(grimoireId < grimoires.length, "Invalid grimoire ID");
        require(!grimoires[grimoireId].sealed, "Grimoire is sealed");

        grimoires[grimoireId].scrolls.push(scroll);
        emit ScrollAdded(grimoireId, scroll);
    }

    function sealGrimoire(uint256 grimoireId) external onlyKeeper {
        require(grimoireId < grimoires.length, "Invalid grimoire ID");
        require(!grimoires[grimoireId].sealed, "Already sealed");

        grimoires[grimoireId].sealed = true;
        emit GrimoireSealed(grimoireId, block.timestamp);
    }

    function getGrimoire(uint256 id) external view returns (Grimoire memory) {
        require(id < grimoires.length, "Invalid grimoire ID");
        return grimoires[id];
    }

    function totalGrimoires() external view returns (uint256) {
        return grimoires.length;
    }
}
