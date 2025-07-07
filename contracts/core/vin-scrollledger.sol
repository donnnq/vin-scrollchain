// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollLedger {
    enum ActionType { Ritual, Transfer, Invocation, Revelation, Summon, Seal }

    struct LedgerEntry {
        ActionType action;
        string description;
        address actor;
        address target;
        uint256 value;
        uint256 timestamp;
    }

    LedgerEntry[] public ledger;
    address public immutable ledgerKeeper;

    event LedgerWritten(
        uint256 indexed id,
        ActionType action,
        string description,
        address indexed actor,
        address indexed target,
        uint256 value,
        uint256 timestamp
    );

    modifier onlyKeeper() {
        require(msg.sender == ledgerKeeper, "Not the ledger keeper");
        _;
    }

    constructor() {
        ledgerKeeper = msg.sender;
    }

    function writeEntry(
        ActionType action,
        string calldata description,
        address target,
        uint256 value
    ) external onlyKeeper {
        ledger.push(LedgerEntry({
            action: action,
            description: description,
            actor: msg.sender,
            target: target,
            value: value,
            timestamp: block.timestamp
        }));

        emit LedgerWritten(
            ledger.length - 1,
            action,
            description,
            msg.sender,
            target,
            value,
            block.timestamp
        );
    }

    function getEntry(uint256 id) external view returns (LedgerEntry memory) {
        require(id < ledger.length, "Invalid entry ID");
        return ledger[id];
    }

    function totalEntries() external view returns (uint256) {
        return ledger.length;
    }
}
