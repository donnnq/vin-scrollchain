// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinRehabSanctum.sol
/// @notice Records rehabilitation efforts and emotional recovery journeys for civic restoration.

contract vinRehabSanctum {
    address public sanctumKeeper;

    struct RehabEntry {
        string name;
        string affliction;
        string recoveryVerse;
        bool activeCase;
        uint timestamp;
    }

    RehabEntry[] public ledger;

    event EntryCreated(string name, string affliction, string recoveryVerse);

    constructor() {
        sanctumKeeper = msg.sender;
    }

    modifier onlyKeeper() {
        require(msg.sender == sanctumKeeper, "Not the sanctum keeper");
        _;
    }

    function createEntry(
        string memory name,
        string memory affliction,
        string memory recoveryVerse,
        bool activeCase
    ) public onlyKeeper {
        ledger.push(RehabEntry(name, affliction, recoveryVerse, activeCase, block.timestamp));
        emit EntryCreated(name, affliction, recoveryVerse);
    }

    function resolveCase(uint index) public onlyKeeper {
        require(index < ledger.length, "Invalid ledger index");
        ledger[index].activeCase = false;
    }

    function getEntry(uint index) public view returns (RehabEntry memory) {
        require(index < ledger.length, "Invalid ledger index");
        return ledger[index];
    }

    function totalEntries() public view returns (uint) {
        return ledger.length;
    }
}
