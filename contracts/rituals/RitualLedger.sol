// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title RitualLedger - Soulbound archive of deployed and executed rituals across zones
/// @author Vinvin
/// @notice Records every ritual with emotional metrics and timestamps

contract RitualLedger {
    address public scrollsmith;

    struct RitualRecord {
        string barangay;
        string name;
        string description;
        uint256 joyBoost;
        uint256 dignityBoost;
        uint256 impactBoost;
        uint256 deployedAt;
        uint256 executedAt;
        bool executed;
    }

    RitualRecord[] public ledger;

    event RitualLogged(string indexed barangay, string name, uint256 timestamp);
    event RitualExecuted(string indexed barangay, string name, uint256 timestamp);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Log a new ritual deployment
    function logRitual(
        string memory barangay,
        string memory name,
        string memory description,
        uint256 joyBoost,
        uint256 dignityBoost,
        uint256 impactBoost
    ) external onlyScrollsmith {
        ledger.push(RitualRecord({
            barangay: barangay,
            name: name,
            description: description,
            joyBoost: joyBoost,
            dignityBoost: dignityBoost,
            impactBoost: impactBoost,
            deployedAt: block.timestamp,
            executedAt: 0,
            executed: false
        }));

        emit RitualLogged(barangay, name, block.timestamp);
    }

    /// @notice Mark a ritual as executed
    function markExecuted(uint256 index) external onlyScrollsmith {
        RitualRecord storage record = ledger[index];
        require(!record.executed, "Already executed");

        record.executed = true;
        record.executedAt = block.timestamp;

        emit RitualExecuted(record.barangay, record.name, block.timestamp);
    }

    /// @notice View all ritual records
    function getAllRituals() external view returns (RitualRecord[] memory) {
        return ledger;
    }

    /// @notice Get rituals by barangay
    function getRitualsByBarangay(string memory barangay) external view returns (RitualRecord[] memory) {
        uint256 count;
        for (uint256 i = 0; i < ledger.length; i++) {
            if (keccak256(bytes(ledger[i].barangay)) == keccak256(bytes(barangay))) {
                count++;
            }
        }

        RitualRecord[] memory result = new RitualRecord[](count);
        uint256 j;
        for (uint256 i = 0; i < ledger.length; i++) {
            if (keccak256(bytes(ledger[i].barangay)) == keccak256(bytes(barangay))) {
                result[j++] = ledger[i];
            }
        }

        return result;
    }
}
