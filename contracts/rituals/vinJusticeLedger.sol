// SPDX-License-Identifier: LEDGER-RITUAL
pragma solidity ^0.8.0;

/// @title vinJusticeLedger: Chronicles dignity allocations and integrity flags
contract vinJusticeLedger {
    struct LogEntry {
        string source;
        string useCase;
        uint256 amount;
        string dignityCode;
    }

    LogEntry[] public logbook;

    event LedgerStamped(string source, string dignityCode);

    function stampLog(string memory source, string memory useCase, uint256 amount, string memory dignityCode) public {
        logbook.push(LogEntry(source, useCase, amount, dignityCode));
        emit LedgerStamped(source, dignityCode);
    }

    function viewLogs() public view returns (LogEntry[] memory) {
        return logbook;
    }
}
