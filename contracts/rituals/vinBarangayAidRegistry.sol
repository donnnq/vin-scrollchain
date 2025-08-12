// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinBarangayAidRegistry - Civic ledger for tracking aid dispatch to barangays
/// @author Vinvin
/// @notice Records aid type, timestamp, and emotional notes per barangay
/// @dev Integrates with vinAidTrigger.sol and civic dashboards

contract vinBarangayAidRegistry {
    address public scrollsmith;

    struct AidEntry {
        string barangayName;
        string aidType;         // e.g. "Food", "Job Referral", "Emotional Support"
        string emotionalNote;   // e.g. "You are not alone", "We believe in your future"
        uint256 timestamp;
    }

    AidEntry[] public aidLog;

    event AidLogged(string barangayName, string aidType, string emotionalNote);

    constructor() {
        scrollsmith = msg.sender;
    }

    function logAid(
        string memory barangayName,
        string memory aidType,
        string memory emotionalNote
    ) public {
        aidLog.push(AidEntry(barangayName, aidType, emotionalNote, block.timestamp));
        emit AidLogged(barangayName, aidType, emotionalNote);
    }

    function totalAidEntries() public view returns (uint256) {
        return aidLog.length;
    }

    function getAidEntry(uint256 index) public view returns (
        string memory barangayName,
        string memory aidType,
        string memory emotionalNote,
        uint256 timestamp
    ) {
        require(index < aidLog.length, "Invalid index");
        AidEntry memory entry = aidLog[index];
        return (entry.barangayName, entry.aidType, entry.emotionalNote, entry.timestamp);
    }
}
